function userPointer(id) {
    return {
        __type: 'Pointer',
        className: '_User',
        objectId: id,
    };
}

function addUserToGroup(group,userId) {
    var groupUserObject = new Parse.Object('Group_User');
    groupUserObject.set('groupId',group);
    groupUserObject.set('user',userPointer(userId));
    return groupUserObject.save();
}

async function clearGroupMembers(group) {
    var groupUserQuery = new Parse.Query('Group_User');
    groupUserQuery.equalTo('groupId',group);
    var groupUsers = await groupUserQuery.find();
    await Parse.Object.destroyAll(groupUsers);
}

Parse.Cloud.define("chats",async (request) => {
    if(request.user == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User not found');
    }
    let query = new Parse.Query('Group_User');
    query.equalTo("user",request.user.toPointer());
    var data = await query.find();
    var otherGroupMembersQuery = new Parse.Query('Group_User');
    otherGroupMembersQuery.include('groupId');
    var ids = data.map(item=>item.get('groupId')?.id ?? item.get('groupId').objectId);
    ids = [...new Set(ids)];
    otherGroupMembersQuery.containedIn('groupId',ids);
    otherGroupMembersQuery.notEqualTo('user',request.user.toPointer());
    var members = await otherGroupMembersQuery.find(); 
    return members;
});

Parse.Cloud.define('create_private_chat',async (request) => {
    if(request.user == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User not found');
    }
    const otherUserId = request.params.otherUserId;
    var groupObject = new Parse.Object('Group');
    groupObject.set('Name','private');
    groupObject.set('admin',request.user.toPointer());
    groupObject.set('private',true);
    var group = await groupObject.save();
    await Promise.all([
        addUserToGroup(group,request.user.id),
        addUserToGroup(group,otherUserId),
    ]);
    return group;
});

Parse.Cloud.define('create_group',async (request) => {
    if(request.user == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User not found');
    }
    const groupName = request.params.groupName;
    const otherUserIds = request.params.otherUserIds;
    var groupObject = new Parse.Object('Group');
    groupObject.set('Name',groupName);
    groupObject.set('admin',request.user.toPointer());
    groupObject.set('private',false);
    var group = await groupObject.save();
    await Promise.all([
        addUserToGroup(group,request.user.id),
        ...otherUserIds.map(id=>addUserToGroup(group,id)),
    ]);
    return group;
});

Parse.Cloud.define('update_group', async (request) => {
    if(request.user == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User not found');
    }
    const groupId = request.params.groupId;
    const groupName = request.params.groupName;
    const otherUserIds = request.params.otherUserIds;
    // get group data
    var group = new Parse.Object('Group');
    group.id = groupId;
    group = await group.fetch();
    // check if user is admin
    if((group.get('admin')?.id ?? group.get('admin')?.objectId) != request.user.id) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User is not admin');
    }
    // update group name
    group.set('Name',groupName);
    await group.save();
    await clearGroupMembers(group);
    // update group members
    await Promise.all([
        addUserToGroup(group,request.user.id),
        ...otherUserIds.map(id=>addUserToGroup(group,id)),
    ]);
    return group;
});

Parse.Cloud.define('delete_group', async (request) => {
    if(request.user == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User not found');
    }
    const groupId = request.params.groupId;
    var groupQuery = new Parse.Query('Group');
    groupQuery.equalTo('objectId',groupId);
    var group = await groupQuery.first();
    
    if(group == null) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'Group not found');
    }
    // check if user is admin
    if((group.get('admin')?.id ?? group.get('admin')?.objectId) != request.user.id) {
        throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND,'User is not admin');
    }
    // delete group
    await group.destroy();

   clearGroupMembers(group);

    return true;
});

Parse.Cloud.define('create_tables', async (request) => {
    var Chats = new Parse.Object('Chats');
    var Group = new Parse.Object('Group');
    var GroupUser = new Parse.Object('Group_User');

    await Promise.all([
        Chats.save(),
        Group.save(),
        GroupUser.save(),
    ]);
    return true;
});