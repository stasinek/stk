//---------------------------------------------------------------------------
#ifndef tsoft_file_vfs_h
#define tsoft_file_vfs_h
//---------------------------------------------------------------------------
namespace ts { namespace file { namespace vfs {
//---------------------------------------------------------------------------
typedef struct disk_super_block {
	char name[B_OS_NAME_len];
	__int32 magic1;
	__int32 fs_byte_order;
	unsigned __int32 block_size;
	__int32 block_shift;
	__int32 num_blocks;
	__int32 used_blocks;
	__int32 inode_size;
	__int32 magic2;
	__int32 blocks_per_ag;
	__int32 ag_shift;
	__int32 num_ags;
	__int32 flags;
	block_run log_blocks;
	__int32 log_start;
	__int32 log_end;
	__int32 magic3;
	inode_addr root_dir;
	inode_addr indices;
		__int32 pad[8];
} disk_super_block;

typedef struct bfs_inode { int32 magic1;
		inode_addr inode_num;
		__int32 uid;
		__int32 gid;
		__int32 mode;
		__int32 flags;
		bigtime_t create_time;
		bigtime_t last_modified_time;
		inode_addr parent;
		inode_addr attributes;
		unsigned __int32 type;
		__int32 inode_size;
		binode_etc *etc;
		data_stream data;
		__int32 pad[4];
		__int32 small_data[1];
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
