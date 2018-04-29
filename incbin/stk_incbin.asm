SECTION .rsrc
   _resource_1:
      incbin  "../rsrc/file_name_1"
   _resource_1_length:
      dw $-resource_1
   _resource_2:
      incbin  "../rsrc/file_name_2"
   _resource_2_length:
      dw $-resource_2
   ...