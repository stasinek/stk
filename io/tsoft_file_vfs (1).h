//---------------------------------------------------------------------------
#ifndef tsoft_file_vfs_h
#define tsoft_file_vfs_h
//---------------------------------------------------------------------------
namespace ts { namespace file { namespace vfs {
//---------------------------------------------------------------------------
typedef struct disk_super_block {
	char name[B_OS_NAME_len];
	int32_t magic1;
	int32_t fs_byte_order;
	uint32_t block_size;
	int32_t block_shift;
	int32_t num_blocks;
	int32_t used_blocks;
	int32_t inode_size;
	int32_t magic2;
	int32_t blocks_per_ag;
	int32_t ag_shift;
	int32_t num_ags;
	int32_t flags;
	block_run log_blocks;
	int32_t log_start;
	int32_t log_end;
	int32_t magic3;
	inode_addr root_dir;
	inode_addr indices;
		int32_t pad[8];
} disk_super_block;

typedef struct bfs_inode { int32 magic1;
		inode_addr inode_num;
		int32_t uid;
		int32_t gid;
		int32_t mode;
		int32_t flags;
		bigtime_t create_time;
		bigtime_t last_modified_time;
		inode_addr parent;
		inode_addr attributes;
		uint32_t type;
		int32_t inode_size;
		binode_etc *etc;
		data_stream data;
		int32_t pad[4];
		int32_t small_data[1];
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
