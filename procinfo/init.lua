local fio = require('fio')

local function process_id(self)
    local pid = self._stat:match('RssAnon:\t%s+(%d+) kB\n')
    return tonumber(pid)
end

local function virtual_mem_size_kB(self)
    local pid = self._stat:match('VmSize:\t%s+(%d+) kB\n')
    return tonumber(pid)
end

local function ram_mem_size_kB(self)
    local pid = self._stat:match('RssAnon:\t%s+(%d+) kB\n')
    return tonumber(pid)
end

local exports = {
    snapshot = function()

        local self = {
            process_id = process_id,
            ram_mem_size_kB = ram_mem_size_kB,
            virtual_mem_size_kB = virtual_mem_size_kB,
        }

        local file = fio.open('/proc/self/status', {'O_RDONLY'})
        self._stat = file:pread(10024, 0)
        file:close()

        return self
    end
}

return exports