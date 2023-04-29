-- sort a linked list in lua
-- takes in 10 random numbers and stores them via linked list, and sorts them

-- create node
local node = {}
node.__index = node

function node.new(value)
    local self = setmetatable({}, node)
    self.value = value
    self.next = nil
    return self
end

-- create linked list
local linkedList = {}
linkedList.__index = linkedList

function linkedList.new()
    local self = setmetatable({}, linkedList)
    self.head = nil
    self.tail = nil
    return self
end

-- add node to linked list
function linkedList:addNode(value)
    local newNode = node.new(value)
    if self.head == nil then
        self.head = newNode
        self.tail = newNode
    else
        self.tail.next = newNode
        self.tail = newNode
    end
end

-- print linked list
function linkedList:printList()
    local current = self.head
    while current ~= nil do
        print(current.value)
        current = current.next
    end
end

-- sort linked list
function linkedList:sortList()
    local current = self.head
    local nextNode = current.next
    local temp = nil
    while current ~= nil do
        while nextNode ~= nil do
            if current.value > nextNode.value then
                temp = current.value
                current.value = nextNode.value
                nextNode.value = temp
            end
            nextNode = nextNode.next
        end
        current = current.next
        if current ~= nil then
            nextNode = current.next
        end
    end
end

-- create linked list
local list = linkedList.new()

-- add nodes to linked list
for i = 1, 10 do
    list:addNode(math.random(1, 100))
end

-- print unsorted list
print("Unsorted List:")
list:printList()

-- sort list
list:sortList()

-- print sorted list
print("Sorted List:")
list:printList()