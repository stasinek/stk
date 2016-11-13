//---------------------------------------------------------------------------
#ifndef tsoft_virtualdiskH
#define tsoft_virtualdiskH
//---------------------------------------------------------------------------
namespace ts { namespace file { namespace virtualdisk {
//---------------------------------------------------------------------------
typedef struct disk_super_block {
	char name[B_OS_NAME_len];
	int32 magic1;
	int32 fs_byte_order;
	uint32 block_size;
	uint32 block_shift;
	off_t num_blocks;
	off_t used_blocks;
	int32 inode_size;
	int32 magic2;
	int32 blocks_per_ag;
	int32 ag_shift;
	int32 num_ags;
	int32 flags;
	block_run log_blocks;
	off_t log_start;
	off_t log_end;
	int32 magic3;
	inode_addr root_dir;
	inode_addr indices;
		int32 pad[8];
} disk_super_block;

typedef struct bfs_inode { int32 magic1;
		inode_addr inode_num;
		int32 uid;
		int32 gid;
		int32 mode;
		int32 flags;
		bigtime_t create_time;
		bigtime_t last_modified_time;
		inode_addr parent;
		inode_addr attributes;
		uint32 type;
		int32 inode_size;
		binode_etc *etc;
		data_stream data;
		int32 pad[4];
		int32 small_data[1];
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
