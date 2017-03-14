//---------------------------------------------------------------------------
#ifndef stk_file_vfs_h
#define stk_file_vfs_h
//---------------------------------------------------------------------------
namespace stk { namespace file { namespace vfs {
//---------------------------------------------------------------------------
typedef struct disk_super_block {
	char name[B_OS_NAME_len];
	uint32_t magic1;
	uint32_t fs_byte_order;
	unsigned uint32_t block_size;
	uint32_t block_shift;
	uint32_t num_blocks;
	uint32_t used_blocks;
	uint32_t inode_size;
	uint32_t magic2;
	uint32_t blocks_per_ag;
	uint32_t ag_shift;
	uint32_t num_ags;
	uint32_t flags;
	block_run log_blocks;
	uint32_t log_start;
	uint32_t log_end;
	uint32_t magic3;
	inode_addr root_dir;
	inode_addr indices;
		uint32_t pad[8];
} disk_super_block;

typedef struct bfs_inode { int32 magic1;
		inode_addr inode_num;
		uint32_t uid;
		uint32_t gid;
		uint32_t mode;
		uint32_t flags;
		bigtime_t create_time;
		bigtime_t last_modified_time;
		inode_addr parent;
		inode_addr attributes;
		unsigned uint32_t type;
		uint32_t inode_size;
		binode_etc *etc;
		data_stream data;
		uint32_t pad[4];
		uint32_t small_data[1];
} bfs_inode;
typedef struct data_stream {
	block_run direct[NUM_DIRECT_BLOCKS]; 
	off_t max_direct_range; block_run indirect; 
	off_t max_indirect_range; 
	block_run double_indirect; 
	off_t max_double_indirect_range; 
	off_t size; 
} data_stream; 
//---------------------------------------------------------------------------
}}}
//---------------------------------------------------------------------------
#endif
