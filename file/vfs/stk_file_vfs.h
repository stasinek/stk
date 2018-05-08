//---------------------------------------------------------------------------
#ifndef __stk_file_vfs_h
#define __stk_file_vfs_h
//---------------------------------------------------------------------------
#include "./../../stk_main.h"
//---------------------------------------------------------------------------
#define VFS_NAME_LEN 32
#define NUM_DIRECT_BLOCKS 8
//---------------------------------------------------------------------------
#ifdef __cplusplus
namespace stk { namespace file { namespace vfs {
#endif
//---------------------------------------------------------------------------
typedef struct data_stream {
        uint8_t direct[NUM_DIRECT_BLOCKS];
        uint64_t max_direct_range; uint32_t indirect;
        uint64_t max_indirect_range;
        uint8_t double_indirect;
        uint64_t max_double_indirect_range;
        uint64_t size;
} data_stream;

typedef struct bfs_inode { int32_t magic1;
                uint32_t inode_num;
                uint32_t uid;
                uint32_t gid;
                uint32_t mode;
                uint32_t flags;
                uint64_t create_time;
                uint64_t last_modified_time;
                uint32_t parent;
                uint32_t attributes;
                uint32_t type;
                uint32_t inode_size;
                void *etc;
                data_stream data;
                uint32_t pad[4];
                uint32_t small_data[1];
} bfs_inode;

typedef struct disk_super_block {
        char name[VFS_NAME_LEN];
        uint32_t magic1;
        uint32_t fs_byte_order;
        uint32_t block_size;
        uint32_t block_shift;
        uint32_t num_blocks;
        uint32_t used_blocks;
        uint32_t inode_size;
        uint32_t magic2;
        uint32_t blocks_per_ag;
        uint32_t ag_shift;
        uint32_t num_ags;
        uint32_t flags;
        uint32_t log_blocks;
        uint32_t log_start;
        uint32_t log_end;
        uint32_t magic3;
        uint32_t root_dir;
        uint32_t indices;
        uint32_t pad[8];
} disk_super_block;
//---------------------------------------------------------------------------
#ifdef __cplusplus
}}}
#endif
//---------------------------------------------------------------------------
#endif
