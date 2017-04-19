FasdUAS 1.101.10   ��   ��    k             l     �� ��    ) #  Created by MacBu Development Team       	  l     �� 
��   
 G A  Copyright (c) 2004 Microsoft Corporation.  All rights reserved.    	     l     ������  ��        l      �� ��   XR ================================
	Script Excel_Erage_Contacts
	
	The Excel_Erage_Contacts script object
	contains all of the data and routines
	that are needed to import the contacts
	from Microsoft Entourage into Microsoft Excel as a list, then to later upload the updated data back into
	Entourage.
  =================================          l     ������  ��        h     �� �� ,0 excel_erage_contacts Excel_Erage_Contacts  k             l     ������  ��        l     �� ��    c ] The contact_item_display_list property contains the fields in the Entourage contact database         l     �� ��    2 , that are supported by this script. They are         l     ��  ��     1 + used as the headings of the list in Excel.      ! " ! j     �� #�� 0 contact_item_display_list   # J      $ $  % & % m      ' '  
First Name    &  ( ) ( m     * *  	Last Name    )  + , + m     - -  Home Street Address    ,  . / . m     0 0  	Home City    /  1 2 1 m     3 3  
Home State    2  4 5 4 m     6 6  Home Zip    5  7 8 7 l 	   9�� 9 m     : :  Home Country   ��   8  ; < ; m     = =  Home Phone Number    <  > ? > m    	 @ @  Mobile Phone Number    ?  A B A m   	 
 C C  
Home Email    B  D E D m   
  F F  Business Street Address    E  G H G m     I I  Business City    H  J K J l 	   L�� L m     M M  Business State   ��   K  N O N m     P P  Business Zip    O  Q R Q m     S S  Business Country    R  T U T m     V V  Business Phone Number    U  W X W m     Y Y  
Work Email    X  Z�� Z m     [ [  ID   ��   "  \ ] \ l     ������  ��   ]  ^ _ ^ l     �� `��   ` M G The Excel_Column_Data property is used to generate the cell references    _  a b a l     �� c��   c + % needed to lay out the list in Excel.    b  d e d j    o�� f�� &0 excel_column_data Excel_Column_Data f J    n g g  h i h m     j j  A    i  k l k m    " m m  B    l  n o n m   " % p p  C    o  q r q m   % ( s s  D    r  t u t m   ( + v v  E    u  w x w m   + . y y  F    x  z { z m   . 1 | |  G    {  } ~ } m   1 4    H    ~  � � � m   4 7 � �  I    �  � � � m   7 : � �  J    �  � � � m   : = � �  K    �  � � � m   = @ � �  L    �  � � � m   @ C � �  M    �  � � � m   C F � �  N    �  � � � m   F I � �  O    �  � � � m   I L � �  P    �  � � � m   L O � �  Q    �  � � � m   O R � �  R    �  � � � m   R U � �  S    �  � � � m   U X � �  T    �  � � � m   X [ � �  U    �  � � � m   [ ^ � �  V    �  � � � m   ^ a � �  W    �  � � � m   a d � �  X    �  � � � m   d g � �  Y    �  ��� � m   g j � �  Z   ��   e  � � � l     ������  ��   �  � � � l     �� ���   � N H The button_height_in_rows property is the height of the button in rows.    �  � � � j   p r�� ��� 0 button_height_in_rows   � m   p q����  �  � � � l     ������  ��   �  � � � l     �� ���   � P J The data_offset_from_button property is the offset from the bottom of the    �  � � � l     �� ���   � . ( button to the top of the list in Excel.    �  � � � j   s u�� ��� 0 data_offset_from_button   � m   s t����  �  � � � l     ������  ��   �  � � � l     �� ���   � 9 3 When the contacts from Entourage are imported into    �  � � � l     �� ���   � J D Excel, the imported_contact_IDs property will keep track of the IDs    �  � � � l     �� ���   � 5 / that were imported. This will be checked later    �  � � � l     �� ���   � : 4 to determine whether any IDs were deleted when the     �  � � � l     �� ���   � , & contacts are uploaded into Entourage.    �  � � � j   v y�� ��� ,0 imported_contact_ids imported_contact_IDs � J   v x����   �  � � � l     ������  ��   �  � � � l      �� ���   �C= 
	-------------------------------------------------------------------------------
		Function:		Get_Entourage_Contacts_Into_Excel
		
		Description:	This function inputs all of the contacts
	  					from Entourage into Excel as a list.	
	-------------------------------------------------------------------------------
	    �  � � � i   z } � � � I      �������� F0 !get_entourage_contacts_into_excel !Get_Entourage_Contacts_Into_Excel��  ��   � k    ? � �  � � � l     ������  ��   �  � � � l     �� ���   � 0 * The ID_List local variable will be filled    �  � � � l     �� ���   � 5 / in with the IDs of every contact in Entourage.    �  � � � l     �� ���   � 1 + It is used to document what contacts were     �  � � � l     �� ���   � ( " originally imported into Excel.      �  � � � r      � � � J     ����   � o      ���� 0 id_list ID_List �  � � � l   ������  ��   �  � � � l   �� ���   � 4 . The erage_contacts local variable is a list.     �  � � � l   �� ���   � 3 - Each item in this list will be another list.    �    l   ����   4 . This inner list will contain the data from an     l   ����   6 0 Entourage contact that will be displayed in the     l   ����     Excel list.    	
	 r    	 J    ����   o      ���� 0 erage_contacts  
  l  
 
������  ��    l  
 
����   1 + The cnt_contacts local variable will track     l  
 
����   3 - the total number of contacts from Entourage.     r   
  m   
 ����   o      ���� 0 cnt_contacts    l   ������  ��    O   i k   h  !  l   ������  ��  ! "#" l   ��$��  $ + % Get the total count of contacts from   # %&% l   ��'��  ' . ( Entourage and then loop to get the data   & ()( l   ��*��  *   out of each contact.   ) +,+ r    -.- I   ��/��
�� .corecnte****       ****/ 2   ��
�� 
cAbE��  . o      ���� 0 cnt_contacts  , 0��0 Y   h1��23��1 k   &c44 565 l  & &������  ��  6 787 l  & &��9��  9 ) # Get the ith contact from Entourge.   8 :;: r   & ,<=< 4   & *��>
�� 
cAbE> o   ( )���� 0 i  = o      ���� 0 cur_contact  ; ?@? l  - -������  ��  @ ABA l  - -��C��  C . ( Set the inner list object that will be    B DED l  - -��F��  F 6 0 placed into the erage_contacts list to an empty   E GHG l  - -��I��  I . ( list before the contact items that are    H JKJ l  - -��L��  L 5 / used by this script are placed into this list.   K MNM r   - 1OPO J   - /����  P o      ���� 0 contact_item_list  N QRQ l  2 2������  ��  R STS l  2 2��U��  U : 4 Get the first name from the contact and place it as   T VWV l  2 2��X��  X ( " item 1 in the contact_item_list.    W YZY Q   2 M[\][ k   5 @^^ _`_ r   5 :aba n   5 8cdc 1   6 8��
�� 
pFrNd o   5 6���� 0 cur_contact  b o      ���� 0 contact_data_item  ` e��e r   ; @fgf b   ; >hih o   ; <���� 0 contact_item_list  i o   < =���� 0 contact_data_item  g o      ���� 0 contact_item_list  ��  \ R      ��jk
�� .ascrerr ****      � ****j o      ���� 0 errmsg errMsgk ��lm
�� 
errnl o      ���� 0 errnum errNumm ��no
�� 
erobn o      ���� 0 errfrom errFromo ��pq
�� 
ptlrp o      ���� 0 	errresult 	errResultq ��r��
�� 
errtr o      ���� 0 errto errTo��  ] r   H Msts b   H Kuvu o   H I���� 0 contact_item_list  v m   I Jww      t o      ���� 0 contact_item_list  Z xyx l  N N������  ��  y z{z l  N N��|��  | 9 3 Get the last name from the contact and place it as   { }~} l  N N��   ( " item 2 in the contact_item_list.    ~ ��� Q   N i���� k   Q \�� ��� r   Q V��� n   Q T��� 1   R T�~
�~ 
pLsN� o   Q R�}�} 0 cur_contact  � o      �|�| 0 contact_data_item  � ��{� r   W \��� b   W Z��� o   W X�z�z 0 contact_item_list  � o   X Y�y�y 0 contact_data_item  � o      �x�x 0 contact_item_list  �{  � R      �w��
�w .ascrerr ****      � ****� o      �v�v 0 errmsg errMsg� �u��
�u 
errn� o      �t�t 0 errnum errNum� �s��
�s 
erob� o      �r�r 0 errfrom errFrom� �q��
�q 
ptlr� o      �p�p 0 	errresult 	errResult� �o��n
�o 
errt� o      �m�m 0 errto errTo�n  � r   d i��� b   d g��� o   d e�l�l 0 contact_item_list  � m   e f��      � o      �k�k 0 contact_item_list  � ��� l  j j�j�i�j  �i  � ��� l  j j�h��h  � 7 1 The Home Address field in Entourage is a record.   � ��� l  j j�g��g  � ( " Get that record from the contact.   � ��� r   j o��� n   j m��� 1   k m�f
�f 
hmAd� o   j k�e�e 0 cur_contact  � o      �d�d 0 
addres_obj  � ��� l  p p�c�b�c  �b  � ��� l  p p�a��a  � ? 9 Check to see whether the record is blank (has no items).   � ��� l  p p�`��`  � = 7 If the record does have items, use them to fill in the   � ��� l  p p�_��_  �   contact_item_list list.   � ��� Z   p*���^�� ?  p w��� l  p u��]� I  p u�\��[
�\ .corecnte****       ****� o   p q�Z�Z 0 
addres_obj  �[  �]  � m   u v�Y�Y  � k   z�� ��� l  z z�X�W�X  �W  � ��� l  z z�V��V  � : 4 Get the street address from the home address record   � ��� l  z z�U��U  � 7 1 and place it as item 3 in the contact_item_list.   � ��� Q   z ����� k   } ��� ��� r   } ���� n   } ���� 1   ~ ��T
�T 
PAST� o   } ~�S�S 0 
addres_obj  � o      �R�R 0 contact_data_item  � ��Q� r   � ���� b   � ���� o   � ��P�P 0 contact_item_list  � o   � ��O�O 0 contact_data_item  � o      �N�N 0 contact_item_list  �Q  � R      �M��
�M .ascrerr ****      � ****� o      �L�L 0 errmsg errMsg� �K��
�K 
errn� o      �J�J 0 errnum errNum� �I��
�I 
erob� o      �H�H 0 errfrom errFrom� �G��
�G 
ptlr� o      �F�F 0 	errresult 	errResult� �E��D
�E 
errt� o      �C�C 0 errto errTo�D  � r   � ���� b   � ���� o   � ��B�B 0 contact_item_list  � m   � ���      � o      �A�A 0 contact_item_list  � ��� l  � ��@�?�@  �?  � ��� l  � ��>��>  � 0 * Get the city from the home address record   � ��� l  � ��=��=  � 7 1 and place it as item 4 in the contact_item_list.   � ��� Q   � ����� k   � ��� ��� r   � ���� n   � ���� 1   � ��<
�< 
PACY� o   � ��;�; 0 
addres_obj  � o      �:�: 0 contact_data_item  � ��9� r   � ���� b   � �   o   � ��8�8 0 contact_item_list   o   � ��7�7 0 contact_data_item  � o      �6�6 0 contact_item_list  �9  � R      �5
�5 .ascrerr ****      � **** o      �4�4 0 errmsg errMsg �3
�3 
errn o      �2�2 0 errnum errNum �1
�1 
erob o      �0�0 0 errfrom errFrom �/	
�/ 
ptlr o      �.�. 0 	errresult 	errResult	 �-
�,
�- 
errt
 o      �+�+ 0 errto errTo�,  � r   � � b   � � o   � ��*�* 0 contact_item_list   m   � �       o      �)�) 0 contact_item_list  �  l  � ��(�'�(  �'    l  � ��&�&   1 + Get the state from the home address record     l  � ��%�%   7 1 and place it as item 5 in the contact_item_list.     Q   � � k   � �  r   � � !  n   � �"#" 1   � ��$
�$ 
PASE# o   � ��#�# 0 
addres_obj  ! o      �"�" 0 contact_data_item   $�!$ r   � �%&% b   � �'(' o   � �� �  0 contact_item_list  ( o   � ��� 0 contact_data_item  & o      �� 0 contact_item_list  �!   R      �)*
� .ascrerr ****      � ****) o      �� 0 errmsg errMsg* �+,
� 
errn+ o      �� 0 errnum errNum, �-.
� 
erob- o      �� 0 errfrom errFrom. �/0
� 
ptlr/ o      �� 0 	errresult 	errResult0 �1�
� 
errt1 o      �� 0 errto errTo�   r   � �232 b   � �454 o   � ��� 0 contact_item_list  5 m   � �66      3 o      �� 0 contact_item_list   787 l  � ����  �  8 9:9 l  � ��;�  ; / ) Get the zip from the home address record   : <=< l  � ��>�  > 7 1 and place it as item 6 in the contact_item_list.   = ?@? Q   � �ABCA k   � �DD EFE r   � �GHG n   � �IJI 1   � ��
� 
PAZPJ o   � ��� 0 
addres_obj  H o      �
�
 0 contact_data_item  F K�	K r   � �LML b   � �NON o   � ��� 0 contact_item_list  O o   � ��� 0 contact_data_item  M o      �� 0 contact_item_list  �	  B R      �PQ
� .ascrerr ****      � ****P o      �� 0 errmsg errMsgQ �RS
� 
errnR o      �� 0 errnum errNumS �TU
� 
erobT o      � �  0 errfrom errFromU ��VW
�� 
ptlrV o      ���� 0 	errresult 	errResultW ��X��
�� 
errtX o      ���� 0 errto errTo��  C r   � �YZY b   � �[\[ o   � ����� 0 contact_item_list  \ m   � �]]      Z o      ���� 0 contact_item_list  @ ^_^ l  � �������  ��  _ `a` l  � ���b��  b 3 - Get the country from the home address record   a cdc l  � ���e��  e 7 1 and place it as item 7 in the contact_item_list.   d fgf Q   �hijh k   � �kk lml r   � �non n   � �pqp 1   � ���
�� 
PACTq o   � ����� 0 
addres_obj  o o      ���� 0 contact_data_item  m r��r r   � �sts b   � �uvu o   � ����� 0 contact_item_list  v o   � ����� 0 contact_data_item  t o      ���� 0 contact_item_list  ��  i R      ��wx
�� .ascrerr ****      � ****w o      ���� 0 errmsg errMsgx ��yz
�� 
errny o      ���� 0 errnum errNumz ��{|
�� 
erob{ o      ���� 0 errfrom errFrom| ��}~
�� 
ptlr} o      ���� 0 	errresult 	errResult~ ����
�� 
errt o      ���� 0 errto errTo��  j r  ��� b  ��� o  ���� 0 contact_item_list  � m  
��      � o      ���� 0 contact_item_list  g ���� l ������  ��  ��  �^  � k  *�� ��� l �����  � 5 / If the home address record was empty, put null   � ��� l �����  � 6 0 string placeholders into the contact_item_list.   � ���� Y  *�������� r  %��� b  #��� o  ���� 0 contact_item_list  � m  "��      � o      ���� 0 contact_item_list  �� 0 i  � m  ���� � m  ���� ��  ��  � ��� l ++������  ��  � ��� l ++�����  � A ; Get the home phone number from the contact and place it as   � ��� l ++�����  � ( " item 8 in the contact_item_list.    � ��� Q  +H���� k  .;�� ��� r  .5��� n  .3��� 1  /3��
�� 
hmNm� o  ./���� 0 cur_contact  � o      ���� 0 contact_data_item  � ���� r  6;��� b  69��� o  67���� 0 contact_item_list  � o  78���� 0 contact_data_item  � o      ���� 0 contact_item_list  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� ����
�� 
errn� o      ���� 0 errnum errNum� ����
�� 
erob� o      ���� 0 errfrom errFrom� ����
�� 
ptlr� o      ���� 0 	errresult 	errResult� �����
�� 
errt� o      ���� 0 errto errTo��  � r  CH��� b  CF��� o  CD���� 0 contact_item_list  � o  DE���� 0 contact_data_item  � o      ���� 0 contact_item_list  � ��� l II������  ��  � ��� l II�����  � C = Get the mobile phone number from the contact and place it as   � ��� l II�����  � ( " item 9 in the contact_item_list.    � ��� Q  If���� k  LY�� ��� r  LS��� n  LQ��� 1  MQ��
�� 
mbNm� o  LM���� 0 cur_contact  � o      ���� 0 contact_data_item  � ���� r  TY��� b  TW��� o  TU���� 0 contact_item_list  � o  UV���� 0 contact_data_item  � o      ���� 0 contact_item_list  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� ����
�� 
errn� o      ���� 0 errnum errNum� ����
�� 
erob� o      ���� 0 errfrom errFrom� ����
�� 
ptlr� o      ���� 0 	errresult 	errResult� �����
�� 
errt� o      ���� 0 errto errTo��  � r  af��� b  ad��� o  ab���� 0 contact_item_list  � o  bc���� 0 contact_data_item  � o      ���� 0 contact_item_list  � ��� l gg������  ��  � ��� l gg�����  � I C The e-mail address for a contact is an element.  This means that a   � ��� l gg�����  � H B single contact can have more than one e-mail address. This script   � ��� l gg�����  � C = assumes that a user has only one e-mail address for the home   � ��� l gg�����  � I C and business types. This is NOT a valid assumption for all users.    � ��� l gg�����  � O I This script will look for the first e-mail address that has a home label   � ��� l gg�����  � < 6 and will use that address as the home e-mail address.   � ��� Q  g����� k  j��� ��� l jj������  ��  � ��� l jj�� ��    : 4 Get the count of e-mail addresses for this contact.   �  r  ju I js����
�� .corecnte****       **** n  jo 2 ko��
�� 
cEmA o  jk���� 0 cur_contact  ��   o      ���� 0 cnt_eaddress cnt_EAddress 	 l vv������  ��  	 

 l vv����   A ; Set a flag to see whether a home e-mail address was found.     r  vy m  vw��
�� boovfals o      ���� 0 found_address    l zz������  ��    l zz����   = 7 Loop over all of the e-mail addresses for this contact     l zz����   , & looking for one with a label of home.     Y  z����� k  ��   l ��������  ��    !"! l ����#��  # B < set cur_EAddress to the ith e-mail address of this contact.   " $%$ r  ��&'& n  ��()( 1  ����
�� 
qpro) n  ��*+* 4  ����,
�� 
cEmA, o  ������ 0 i  + o  ������ 0 cur_contact  ' o      ���� 0 cur_eaddress cur_EAddress% -.- l ����~�  �~  . /0/ l ���}1�}  1 > 8 Check whether this e-mail address has a label of home.    0 2�|2 Z  ��34�{�z3 = ��565 n  ��787 1  ���y
�y 
clbl8 o  ���x�x 0 cur_eaddress cur_EAddress6 m  ���w
�w ePATeHme4 k  ��99 :;: l ���v�u�v  �u  ; <=< l ���t>�t  > 8 2 If this e-mail address does have a label of home,   = ?@? l ���sA�s  A 6 0  place it as item 10 in the contact_item_list.    @ BCB r  ��DED n  ��FGF 1  ���r
�r 
pcntG o  ���q�q 0 cur_eaddress cur_EAddressE o      �p�p 0 contact_data_item  C HIH r  ��JKJ b  ��LML o  ���o�o 0 contact_item_list  M o  ���n�n 0 contact_data_item  K o      �m�m 0 contact_item_list  I NON l ���l�k�l  �k  O PQP l ���jR�j  R ? 9 Set the found_address variable to true, specifying that    Q STS l ���iU�i  U ( " an e-mail address has been found.   T VWV r  ��XYX m  ���h
�h boovtrueY o      �g�g 0 found_address  W Z[Z l ���f�e�f  �e  [ \]\ l ���d^�d  ^ 1 + Since an address was found, exit the loop.   ] _�c_  S  ���c  �{  �z  �|  �� 0 i   m  }~�b�b  o  ~�a�a 0 cnt_eaddress cnt_EAddress��   `a` l ���`�_�`  �_  a bcb l ���^d�^  d < 6 If no home address was found, add a blank placeholder   c efe l ���]g�]  g ' ! into the contact_item_list list.   f hih Z  ��jk�\�[j H  ��ll o  ���Z�Z 0 found_address  k r  ��mnm b  ��opo o  ���Y�Y 0 contact_item_list  p m  ��qq      n o      �X�X 0 contact_item_list  �\  �[  i r�Wr l ���V�U�V  �U  �W  � R      �Tst
�T .ascrerr ****      � ****s o      �S�S 0 errmsg errMsgt �Ruv
�R 
errnu o      �Q�Q 0 errnum errNumv �Pwx
�P 
erobw o      �O�O 0 errfrom errFromx �Nyz
�N 
ptlry o      �M�M 0 	errresult 	errResultz �L{�K
�L 
errt{ o      �J�J 0 errto errTo�K  � k  ��|| }~} l ���I�H�I  �H  ~ � l ���G��G  � I C If an error occurs getting the e-mail addresses from this contact,   � ��� l ���F��F  � @ : add a blank placeholder into the  contact_item_list list.   � ��E� r  ����� b  ����� o  ���D�D 0 contact_item_list  � m  ����      � o      �C�C 0 contact_item_list  �E  � ��� l ���B�A�B  �A  � ��� l ���@��@  � ; 5 The Business Address field in Entourage is a record.   � ��� l ���?��?  � ( " Get that record from the contact.   � ��� r  ����� n  ����� 1  ���>
�> 
bsAd� o  ���=�= 0 cur_contact  � o      �<�< 0 
addres_obj  � ��� l ���;�:�;  �:  � ��� l ���9��9  � ? 9 Check to see whether the record is blank (has no items).   � ��� l ���8��8  � 5 / If it does have items, use them to fill in the   � ��� l ���7��7  �   contact_item_list list.   � ��� Z  �����6�� ? ����� l ����5� I ���4��3
�4 .corecnte****       ****� o  ���2�2 0 
addres_obj  �3  �5  � m  ���1�1  � k  ���� ��� l ���0�/�0  �/  � ��� l ���.��.  � > 8 Get the street address from the business address record   � ��� l ���-��-  � 8 2 and place it as item 11 in the contact_item_list.   � ��� Q  ����� k  ���� ��� r  ����� n  ����� 1  ���,
�, 
PAST� o  ���+�+ 0 
addres_obj  � o      �*�* 0 contact_data_item  � ��)� r  ����� b  ����� o  ���(�( 0 contact_item_list  � o  ���'�' 0 contact_data_item  � o      �&�& 0 contact_item_list  �)  � R      �%��
�% .ascrerr ****      � ****� o      �$�$ 0 errmsg errMsg� �#��
�# 
errn� o      �"�" 0 errnum errNum� �!��
�! 
erob� o      � �  0 errfrom errFrom� ���
� 
ptlr� o      �� 0 	errresult 	errResult� ���
� 
errt� o      �� 0 errto errTo�  � r  ��� b  	��� o  �� 0 contact_item_list  � m  ��      � o      �� 0 contact_item_list  � ��� l ���  �  � ��� l ���  � 4 . Get the city from the business address record   � ��� l ���  � 8 2 and place it as item 12 in the contact_item_list.   � ��� Q  )���� k  �� ��� r  ��� n  ��� 1  �
� 
PACY� o  �� 0 
addres_obj  � o      �� 0 contact_data_item  � ��� r  ��� b  ��� o  �� 0 contact_item_list  � o  �� 0 contact_data_item  � o      �� 0 contact_item_list  �  � R      ���
� .ascrerr ****      � ****� o      �� 0 errmsg errMsg� ���
� 
errn� o      �
�
 0 errnum errNum� �	��
�	 
erob� o      �� 0 errfrom errFrom� ���
� 
ptlr� o      �� 0 	errresult 	errResult� ���
� 
errt� o      �� 0 errto errTo�  � r  ")��� b  "'��� o  "#�� 0 contact_item_list  � m  #&��      � o      �� 0 contact_item_list  � ��� l **� ���   ��  � ��� l **�� ��    5 / Get the state from the business address record   �  l **����   8 2 and place it as item 13 in the contact_item_list.     Q  *G k  -8		 

 r  -2 n  -0 1  .0��
�� 
PASE o  -.���� 0 
addres_obj   o      ���� 0 contact_data_item   �� r  38 b  36 o  34���� 0 contact_item_list   o  45���� 0 contact_data_item   o      ���� 0 contact_item_list  ��   R      ��
�� .ascrerr ****      � **** o      ���� 0 errmsg errMsg ��
�� 
errn o      ���� 0 errnum errNum ��
�� 
erob o      ���� 0 errfrom errFrom ��
�� 
ptlr o      ���� 0 	errresult 	errResult ����
�� 
errt o      ���� 0 errto errTo��   r  @G b  @E !  o  @A���� 0 contact_item_list  ! m  AD""       o      ���� 0 contact_item_list   #$# l HH������  ��  $ %&% l HH��'��  ' 8 2 Get the ZIP code from the business address record   & ()( l HH��*��  * 8 2 and place it as item 14 in the contact_item_list.   ) +,+ Q  Hg-./- k  KX00 121 r  KR343 n  KP565 1  LP��
�� 
PAZP6 o  KL���� 0 
addres_obj  4 o      ���� 0 contact_data_item  2 7��7 r  SX898 b  SV:;: o  ST���� 0 contact_item_list  ; o  TU���� 0 contact_data_item  9 o      ���� 0 contact_item_list  ��  . R      ��<=
�� .ascrerr ****      � ****< o      ���� 0 errmsg errMsg= ��>?
�� 
errn> o      ���� 0 errnum errNum? ��@A
�� 
erob@ o      ���� 0 errfrom errFromA ��BC
�� 
ptlrB o      ���� 0 	errresult 	errResultC ��D��
�� 
errtD o      ���� 0 errto errTo��  / r  `gEFE b  `eGHG o  `a���� 0 contact_item_list  H m  adII      F o      ���� 0 contact_item_list  , JKJ l hh������  ��  K LML l hh��N��  N 7 1 Get the country from the business address record   M OPO l hh��Q��  Q 8 2 and place it as item 15 in the contact_item_list.   P RSR Q  h�TUVT k  kxWW XYX r  krZ[Z n  kp\]\ 1  lp��
�� 
PACT] o  kl���� 0 
addres_obj  [ o      ���� 0 contact_data_item  Y ^��^ r  sx_`_ b  svaba o  st���� 0 contact_item_list  b o  tu���� 0 contact_data_item  ` o      ���� 0 contact_item_list  ��  U R      ��cd
�� .ascrerr ****      � ****c o      ���� 0 errmsg errMsgd ��ef
�� 
errne o      ���� 0 errnum errNumf ��gh
�� 
erobg o      ���� 0 errfrom errFromh ��ij
�� 
ptlri o      ���� 0 	errresult 	errResultj ��k��
�� 
errtk o      ���� 0 errto errTo��  V r  ��lml b  ��non o  ������ 0 contact_item_list  o m  ��pp      m o      ���� 0 contact_item_list  S q��q l ��������  ��  ��  �6  � k  ��rr sts l ����u��  u 9 3 If the business address record was empty, put null   t vwv l ����x��  x 6 0 string placeholders into the contact_item_list.   w y��y Y  ��z��{|��z r  ��}~} b  ��� o  ������ 0 contact_item_list  � m  ����      ~ o      ���� 0 contact_item_list  �� 0 i  { m  ������ | m  ������ ��  ��  � ��� l ��������  ��  � ��� l �������  � E ? Get the business phone number from the contact and place it as   � ��� l �������  � ) # item 16 in the contact_item_list.    � ��� Q  ������ k  ���� ��� r  ����� n  ����� 1  ����
�� 
bsNm� o  ������ 0 cur_contact  � o      ���� 0 contact_data_item  � ���� r  ����� b  ����� o  ������ 0 contact_item_list  � o  ������ 0 contact_data_item  � o      ���� 0 contact_item_list  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errmsg errMsg� ����
�� 
errn� o      ���� 0 errnum errNum� ����
�� 
erob� o      ���� 0 errfrom errFrom� ����
�� 
ptlr� o      ���� 0 	errresult 	errResult� �����
�� 
errt� o      ���� 0 errto errTo��  � r  ����� b  ����� o  ������ 0 contact_item_list  � m  ����      � o      ���� 0 contact_item_list  � ��� l ��������  ��  � ��� l �������  � I C The e-mail address for a contact is an element.  This means that a   � ��� l �������  � H B single contact can have more than one e-mail address. This script   � ��� l �������  � I C assumes that a user will only have one e-mail address for the home   � ��� l �������  � I C and business types. This is NOT a valid assumption for all users.    � ��� l �������  � S M This script will look for the first e-mail address that has a business label   � ��� l �������  � @ : and will use that address as the business e-mail address.   � ��� Q  �5���� k  �(�� ��� l ��������  ��  � ��� l �������  � : 4 Get the count of e-mail addresses for this contact.   � ��� r  ����� I �������
�� .corecnte****       ****� n  ����� 2 ����
�� 
cEmA� o  ������ 0 cur_contact  ��  � o      ���� 0 cnt_eaddress cnt_EAddress� ��� l ��������  ��  � ��� l �������  � E ? Set a flag to see whether a business e-mail address was found.   � ��� r  ����� m  ����
�� boovfals� o      ���� 0 found_address  � ��� l ����~�  �~  � ��� l ���}��}  � = 7 Loop over all of the e-mail addresses for this contact   � ��� l ���|��|  � , & looking for one with a label of work.   � ��� Y  ���{���z� k  ��� ��� l ���y�x�y  �x  � ��� l ���w��w  � B < Set cur_EAddress to the ith e-mail address of this contact.   � ��� r  ����� n  ����� 1  ���v
�v 
qpro� n  ����� 4  ���u�
�u 
cEmA� o  ���t�t 0 i  � o  ���s�s 0 cur_contact  � o      �r�r 0 cur_eaddress cur_EAddress� ��� l ���q�p�q  �p  � ��� l ���o��o  � > 8 Check whether this e-mail address has a label of work.    � ��n� Z  ����m�l� = ����� n  ����� 1  ���k
�k 
clbl� o  ���j�j 0 cur_eaddress cur_EAddress� m  ���i
�i ePATeWrk� k  �    l ���h�g�h  �g    l ���f�f   8 2 If this e-mail address does have a label of work,     l ���e�e   6 0  place it as item 17 in the contact_item_list.     	
	 r  � n  �  1  � �d
�d 
pcnt o  ���c�c 0 cur_eaddress cur_EAddress o      �b�b 0 contact_data_item  
  r   b   o  �a�a 0 contact_item_list   o  �`�` 0 contact_data_item   o      �_�_ 0 contact_item_list    l 		�^�]�^  �]    l 		�\�\   ? 9 Set the found_address variable to true, specifying that      l 		�[�[   #  an e-mail address was found.     r  	  m  	
�Z
�Z boovtrue  o      �Y�Y 0 found_address   !"! l �X�W�X  �W  " #$# l �V%�V  % 1 + Since an address was found, exit the loop.   $ &�U&  S  �U  �m  �l  �n  �{ 0 i  � m  ���T�T � o  ���S�S 0 cnt_eaddress cnt_EAddress�z  � '(' l �R�Q�R  �Q  ( )*) l �P+�P  + < 6 If no work address was found, add a blank placeholder   * ,-, l �O.�O  . ' ! into the contact_item_list list.   - /0/ Z  &12�N�M1 H  33 o  �L�L 0 found_address  2 r  "454 b   676 o  �K�K 0 contact_item_list  7 o  �J�J 0 contact_data_item  5 o      �I�I 0 contact_item_list  �N  �M  0 8�H8 l ''�G�F�G  �F  �H  � R      �E9:
�E .ascrerr ****      � ****9 o      �D�D 0 errmsg errMsg: �C;<
�C 
errn; o      �B�B 0 errnum errNum< �A=>
�A 
erob= o      �@�@ 0 errfrom errFrom> �??@
�? 
ptlr? o      �>�> 0 	errresult 	errResult@ �=A�<
�= 
errtA o      �;�; 0 errto errTo�<  � k  05BB CDC l 00�:�9�:  �9  D EFE l 00�8G�8  G I C If an error occurs getting the e-mail addresses from this contact,   F HIH l 00�7J�7  J @ : add a blank placeholder into the  contact_item_list list.   I K�6K r  05LML b  03NON o  01�5�5 0 contact_item_list  O o  12�4�4 0 contact_data_item  M o      �3�3 0 contact_item_list  �6  � PQP l 66�2�1�2  �1  Q RSR l 66�0T�0  T 2 , Get the ID from the contact and place it as   S UVU l 66�/W�/  W ) # item 18 in the contact_item_list.    V XYX l 66�.�-�.  �-  Y Z[Z Q  6[\]^\ k  9L__ `a` r  9@bcb n  9>ded 1  :>�,
�, 
ID  e o  9:�+�+ 0 cur_contact  c o      �*�* 0 contact_data_item  a fgf r  AFhih b  ADjkj o  AB�)�) 0 contact_item_list  k o  BC�(�( 0 contact_data_item  i o      �'�' 0 contact_item_list  g lml l GG�&�%�&  �%  m non l GG�$p�$  p 8 2 Add this ID to the list of IDs that were imported   o qrq l GG�#s�#  s : 4 from Entourage so that deletions can be determined.   r t�"t r  GLuvu b  GJwxw o  GH�!�! 0 id_list ID_Listx o  HI� �  0 contact_data_item  v o      �� 0 id_list ID_List�"  ] R      �yz
� .ascrerr ****      � ****y o      �� 0 errmsg errMsgz �{|
� 
errn{ o      �� 0 errnum errNum| �}~
� 
erob} o      �� 0 errfrom errFrom~ ��
� 
ptlr o      �� 0 	errresult 	errResult� ���
� 
errt� o      �� 0 errto errTo�  ^ r  T[��� b  TY��� o  TU�� 0 contact_item_list  � m  UX��      � o      �� 0 contact_item_list  [ ��� l \\���  �  � ��� l \\���  � E ? Now that all 18 items have been added to the contact_item_list   � ��� l \\���  � O I for this contact, append this list as a list to the erage_contacts list.   � ��� r  \c��� b  \a��� o  \]�� 0 erage_contacts  � J  ]`�� ��� o  ]^�
�
 0 contact_item_list  �  � o      �	�	 0 erage_contacts  �  �� 0 i  2 m     �� 3 o     !�� 0 cnt_contacts  ��  ��   m    ���null     ߀�� 5oMicrosoft Entourage of the contacts
	  					from Entourage intoOPIM   alis    �   Perrin                     ��H+   5oMicrosoft Entourage                                             7�k<@APPLOPIM����  	                Microsoft Office 2004     ��#      �k��     5o  f  =Perrin:Applications:Microsoft Office 2004:Microsoft Entourage   (  M i c r o s o f t   E n t o u r a g e    P e r r i n  6Applications/Microsoft Office 2004/Microsoft Entourage  / ��   ��� l jj���  �  � ��� l jj���  � = 7 Get the path to the temporary folder as a string. This   � ��� l jj���  � / ) will be used to save the Excel workbook.   � ��� r  j{��� I jw���
� .earsffdralis        afdr� m  jm�
� afdrtemp� � ���
�  
rtyp� m  ps��
�� 
TEXT��  � o      ���� 0 temporary_folder  � ��� l ||������  ��  � ��� l ||�����  � @ : Create a new workbook to hold the contact data in Excel.	   � ��� O  |���� k  ���� ��� I ��������
�� .miscactvnull��� ��� null��  ��  � ��� I �������
�� .corecrel****      � null��  � �����
�� 
kocl� m  ����
�� 
X141��  � ��� l ��������  ��  � ��� l �������  � ? 9 Save the newly created workbook in the temporary folder.   � ��� r  ����� b  ����� o  ������ 0 temporary_folder  � m  ����  Entourage Contacts   � o      ���� 0 temp_filename  � ��� I ������
�� .coresavenull���    obj � 1  ����
�� 
1172� �����
�� 
kfil� o  ������ 0 temp_filename  ��  � ��� l ��������  ��  � ��� l �������  � 8 2 Set the view of the workbook to normal and remove   � ��� l �������  � - ' page breaks to make it easier to read.   � ��� r  ����� l ������ 5  �������
�� 
cwin� m  ����  Entourage Contacts   
�� kfrmname��  � o      ���� 0 contact_window  � ��� r  ����� m  ����
�� e239 � l     ���� n      ��� 1  ����
�� 
1149� o  ������ 0 contact_window  ��  � ��� r  ����� m  ����
�� boovfals� l     ���� n      ��� 1  ����
�� 
1760� l ������ 1  ����
�� 
1107��  ��  � ��� l ��������  ��  � ��� l �������  � � � Eventually, a button will be created at the top of the sheet. The button will be used to export the contact list back to Entourage. It will be put   � ��� l �������  � @ : on the top so that if contacts are added to the list, the   � ��� l �������  � ; 5 list will not "run into" the button. This means that   � ��� l �������  � A ; the data for the contacts has to start at some offset from   � ��� l �������  � @ : the top of the worksheet. The offset is the height of the   � ��� l �������  � C = button (in rows) and an offset from the bottom of the button   � ��� l �������  � ( " to the top of the list (in rows).   � ��� r  ����� l �� ��  [  �� o  ������ 0 button_height_in_rows   o  ������ 0 data_offset_from_button  ��  � o      ���� 0 list_offset  �  l ��������  ��    l ������   ; 5 Create the column header row at the top of the list.    	 r  ��

 I ������
�� .corecnte****       **** o  ������ 0 contact_item_display_list  ��   o      ���� 0 cnt_headings  	  l ��������  ��    l ������   * $ Add labels to the column headings.      Y  �5���� k  0  l ������  ��    l ����   7 1 The cell_reference will range from "A6" to "R6".     r    c  !"! l #��# b  $%$ l &��& n  '(' 4  ��)
�� 
cobj) o  
���� 0 i  ( o  ���� &0 excel_column_data Excel_Column_Data��  % o  ���� 0 list_offset  ��  " m  ��
�� 
utxt  o      ���� 0 cell_reference   *+* l ������  ��  + ,-, l ��.��  . 1 + Use the index to select the header string.   - /��/ r  0010 l #2��2 n  #343 4  #��5
�� 
cobj5 o  !"���� 0 i  4 o  ���� 0 contact_item_display_list  ��  1 l     6��6 n      787 1  +/��
�� 
15628 4  #+��9
�� 
ccel9 o  '*���� 0 cell_reference  ��  ��  �� 0 i   m  ������  o  ������ 0 cnt_headings  ��   :;: l 66������  ��  ; <=< l 66��>��  > 4 . Get the count of imported Entourage contacts.   = ?@? r  6=ABA I 6;��C��
�� .corecnte****       ****C o  67���� 0 erage_contacts  ��  B o      ���� 0 cnt_contacts  @ DED l >>������  ��  E FGF l >>��H��  H ( " Loop over the number of contacts.   G IJI Y  >�K��LM��K k  H�NN OPO l HH������  ��  P QRQ l HH��S��  S < 6 Each item in the erage_contacts list is itself a list   R TUT l HH��V��  V 9 3 of the data for a single contact. Get the ith list   U WXW l HH��Y��  Y $  from the erage_contacts list.   X Z[Z r  HR\]\ n  HN^_^ 4  IN��`
�� 
cobj` o  LM���� 0 i  _ o  HI���� 0 erage_contacts  ] o      ���� 0 cur_contant_data  [ aba l SS������  ��  b cdc l SS��e��  e 7 1 Loop over the number of items in the inner list.   d f��f Y  S�g��hi��g k  _�jj klk l __������  ��  l mnm l __��o��  o 5 / The cell reference will range from "A-R:1-18".   n pqp r  _yrsr c  _utut l _qv��v b  _qwxw l _ky��y n  _kz{z 4  dk��|
�� 
cobj| o  gj���� 0 j  { o  _d���� &0 excel_column_data Excel_Column_Data��  x l kp}��} [  kp~~ o  kl���� 0 i   o  lo�� 0 list_offset  ��  ��  u m  qt�~
�~ 
utxts o      �}�} 0 cell_reference  q ��� l zz�|�{�|  �{  � ��� l zz�z��z  � O I Set the formula (a string) in the cell referred to by the cell_reference   � ��� l zz�y��y  � X R to the corresponding value in the contact data list in the cur_contant_data list.   � ��x� r  z���� l z���w� n  z���� 4  }��v�
�v 
cobj� o  ���u�u 0 j  � o  z}�t�t 0 cur_contant_data  �w  � l     ��s� n      ��� 1  ���r
�r 
1562� 4  ���q�
�q 
ccel� o  ���p�p 0 cell_reference  �s  �x  �� 0 j  h m  VW�o�o i o  WZ�n�n 0 cnt_headings  ��  ��  �� 0 i  L m  AB�m�m M o  BC�l�l 0 cnt_contacts  ��  J ��� l ���k�j�k  �j  � ��� l ���i��i  � %  Name the worksheet "Contacts".   � ��� r  ����� l ����h� 1  ���g
�g 
1107�h  � o      �f�f 0 contact_sheet Contact_Sheet� ��� r  ����� m  ����  Contacts   � l     ��e� n      ��� 1  ���d
�d 
pnam� o  ���c�c 0 contact_sheet Contact_Sheet�e  � ��� r  ����� l ����b� n  ����� 5  ���a��`
�a 
X128� m  ����  Contacts   
�` kfrmname� l ����_� 1  ���^
�^ 
1172�_  �b  � l     ��]� o      �\�\ 0 contact_sheet Contact_Sheet�]  � ��� l ���[�Z�[  �Z  � ��� l ���Y�X�Y  �X  � ��� l ���W��W  � 7 1 In order to know that a contact was deleted from   � ��� l ���V��V  � 4 . from the Excel list, the original contact IDs   � ��� l ���U��U  � / ) that were imported into Excel need to be   � ��� l ���T��T  � 8 2 "remembered" so that they can be checked against    � ��� l ���S��S  � 6 0 what IDs are still there when the time comes to   � ��� l ���R��R  � = 7 update Entourage. To "remember" the IDs, create a new    � ��� l ���Q��Q  � , & worksheet to hold all of the IDs that   � ��� l ���P��P  �   were imported.   � ��� r  ����� I ���O�N�
�O .corecrel****      � null�N  � �M��
�M 
kocl� m  ���L
�L 
XwSH� �K��
�K 
insh� n  �����  ;  ��� l ����J� 1  ���I
�I 
1172�J  � �H��G
�H 
prdt� K  ���� �F��E
�F 
pnam� m  ����  ID Sheet   �E  �G  � o      �D�D 0 id_sheet ID_Sheet� ��� l ���C�B�C  �B  � ��� l ���A��A  � . ( Make the new ID_sheet the active sheet.   � ��� I ���@��?
�@ .miscactvnull��� ��� null� o  ���>�> 0 id_sheet ID_Sheet�?  � ��� l ���=�<�=  �<  � ��� l ���;��;  � = 7 Starting at location A1, insert the IDs down Column A    � ��� l ���:��:  � > 8 so that later they can be checked against which IDs are   � ��� l ���9��9  �   still there.   � ��� r  ����� I ���8��7
�8 .corecnte****       ****� o  ���6�6 0 id_list ID_List�7  � o      �5�5 0 cnt_id cnt_ID� ��� Y  �$��4���3� r  
��� n  
��� 4  �2�
�2 
cobj� o  �1�1 0 i  � o  
�0�0 0 id_list ID_List� l     ��/� n      � � 1  �.
�. 
1562  4  �-
�- 
ccel l �, b   m    A    o  �+�+ 0 i  �,  �/  �4 0 i  � m  �*�* � o  �)�) 0 cnt_id cnt_ID�3  �  l %%�(�'�(  �'   	 l %%�&
�&  
 F @ Select the original contact sheet (the sheet named "Contacts").   	  I %,�%�$
�% .coreslctnull��� ��� obj  o  %(�#�# 0 contact_sheet Contact_Sheet�$    l --�"�!�"  �!    l --� �    K E The range_reference local variable will be set to include all of the     l --��     cells in the list.     r  -S c  -O l -K� b  -K b  -E  b  -8!"! b  -4#$# m  -0%%  A   $ o  03�� 0 list_offset  " m  47&&  :     l 8D'�' n  8D()( 4  =D�*
� 
cobj* o  @C�� 0 cnt_headings  ) o  8=�� &0 excel_column_data Excel_Column_Data�   l EJ+�+ [  EJ,-, o  EF�� 0 cnt_contacts  - o  FI�� 0 list_offset  �  �   m  KN�
� 
utxt o      �� 0 range_referece   ./. r  T`010 4  T\�2
� 
X1172 o  X[�� 0 range_referece  1 o      �� 0 myrange myRange/ 343 l aa���  �  4 565 l aa�7�  7 W Q Turn the range of the cells containing the Entourage contacts into a list object   6 898 l aa�:�  : / ) to facilitate working with contact data.   9 ;<; r  a�=>= I a���?
� .corecrel****      � null�  ? �
@A
�
 
kocl@ m  eh�	
�	 
X244A �BC
� 
inshB 1  kp�
� 
1107C �D�
� 
prdtD K  s{EE �F�
� 
2180F o  vy�� 0 myrange myRange�  �  > o      �� 0 mylist myList< GHG l ��� ���   ��  H IJI l ����K��  K S M Use the autofit command on the Contact list range to format the list object.   J LML I ����N��
�� .sTBL1524null���   7 X117N o  ������ 0 myrange myRange��  M OPO l ��������  ��  P QRQ l ����S��  S ; 5 Set the cell_reference variable to the last column,    R TUT l ����V��  V D > which contains the Contact IDs. The Contact IDs should not be   U WXW l ����Y��  Y D > changed, so setting the column width to 0 will hide the data.   X Z[Z r  ��\]\ c  ��^_^ l ��`��` b  ��aba b  ��cdc l ��e��e n  ��fgf 4  ����h
�� 
cobjh m  ������ g o  ������ &0 excel_column_data Excel_Column_Data��  d m  ��ii  :   b l ��j��j n  ��klk 4  ����m
�� 
cobjm m  ������ l o  ������ &0 excel_column_data Excel_Column_Data��  ��  _ m  ����
�� 
utxt] o      ���� 0 cell_reference  [ n��n r  ��opo m  ������  p l     q��q n      rsr 1  ����
�� 
1536s 4  ����t
�� 
ccolt o  ������ 0 cell_reference  ��  ��  � m  |uu�null     ߀�� 5oMicrosoft Excelra    ��th����       ����    	�|   ������XCEL   alis    �   Perrin                     ��H+   5oMicrosoft Excel                                                 7#�k<@APPLXCEL����  	                Microsoft Office 2004     ��#      �k��     5o  f  9Perrin:Applications:Microsoft Office 2004:Microsoft Excel      M i c r o s o f t   E x c e l    P e r r i n  2Applications/Microsoft Office 2004/Microsoft Excel  / ��  � vwv l ��������  ��  w xyx l ����z��  z b \ One of the features of Excel AppleScript implementation is that the on-action property for    y {|{ l ����}��  } %  some of the controls can be an   | ~~ l �������  � ? 9 AppleScript instead of a VB macro. Unlike a VB macro, an    ��� l �������  � G A AppleScript is NOT saved when the workbook is saved.  This is a    � ��� l �������  � D > significant limitation for static data usage. For a situation   � ��� l �������  � G A where the data lives only during a single usage, this limitation   � ��� l �������  � I C is not a deterrent. The following code will create a button on the   � ��� l �������  � R L "Contacts" sheet and then "attach" an Applescript to that button that will    � ��� l �������  � / ) upload the contacts back into Entourage.   � ��� l ��������  ��  � ��� l �������  � @ : In order to ensure that the script object will be in the    � ��� l �������  � 8 2 correct form, this script object needs to stored.   � ��� l �������  � 7 1 It will be stored in the temporary items folder.   � ��� l �������  � ? 9 If an error occurs while trying to save the script, then   � ��� l �������  � > 8 the do_button flag will be set to false and the button    � ��� l �������  � 9 3 will not be made. This script can be run again to    � ��� l �������  � 7 1 update Entourage without the need of the button.   � ��� r  ����� c  ����� l ������ b  ����� o  ������ 0 temporary_folder  � m  ����  ContactsScriptObject   ��  � m  ����
�� 
utxt� o      ���� 0 script_file  � ��� r  ����� m  ����
�� boovtrue� o      ���� 0 	do_button  � ��� Q  ����� I ������
�� .sysostornull��� ��� scpt� o  ������ ,0 excel_erage_contacts Excel_Erage_Contacts� ����
�� 
fpth� o  ������ 0 script_file  � �����
�� 
savo� m  ����
�� savoyes ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r  ���� m  ����
�� boovfals� o      ���� 0 	do_button  � ��� l ������  ��  � ��� l �����  � : 4 If the script object was created successfully, then   � ��� l �����  � ( " continue on to create the button.   � ���� Z  ?������� o  ���� 0 	do_button  � k  ;�� ��� l ������  ��  � ��� l �����  � 7 1 The local variable Update_button_script contains   � ��� l �����  � > 8 the script that will be run when the button is pressed.   � ��� l �����  � M G It will set up a local variable (run_script) to see whether the script   � ��� l �����  � M G object loaded successfully. If the script has successfully loaded, the   � ��� l �����  � E ? script object will execute the  update_from_Excel_to_Entourage   � ��� l �����  � D > function which will update the contacts in Entourage and then   � ��� l �����  �   close the workbook.   � ��� r  c��� b  _��� b  [��� b  W��� b  S��� b  O��� b  K��� b  G��� b  C��� b  ?��� b  ;��� b  7� � b  3 b  / b  + b  ' b  #	
	 b   b   b   b   b   l 	�� m    set run_script to true   ��   o  ��
�� 
ret  l 	�� m   ? 9set temporary_folder to path to temporary items as string   ��   o  ��
�� 
ret  l 	�� m   M Gset script_file to (temporary_folder & "ContactsScriptObject") as alias   ��   o  ��
�� 
ret 
 l 	"�� m  " 	 try   ��   o  #&��
�� 
ret  l 	'*�� m  '* . (set my_script to load script script_file   ��   o  +.��
�� 
ret  l 	/2�� m  /2    on error   ��    o  36��
�� 
ret � l 	7:!��! m  7:""  set run_script to false   ��  � o  ;>��
�� 
ret � l 	?B#��# m  ?B$$  end try   ��  � o  CF��
�� 
ret � l 	GJ%��% m  GJ&&  if run_script then   ��  � o  KN��
�� 
ret � l 	OR'��' m  OR(( 8 2tell my_script to update_from_Excel_to_Entourage()   ��  � o  SV��
�� 
ret � l 	WZ)��) m  WZ**  end if   ��  � o  [^��
�� 
ret � o      ���� ,0 update_button_script Update_button_script� +,+ l dd������  ��  , -.- l dd��/��  / ( " Put the button onto the workseet.   . 0��0 O  d;121 k  j:33 454 l jj������  ��  5 676 l jj��8��  8 , & Determine the height of a single row.   7 9:9 l jj��;��  ; " set row_range to range "A:A"   : <=< r  jz>?> n  jv@A@ 1  rv��
�� 
1611A 4  jr��B
�� 
X117B m  nqCC  A1   ? o      ���� 0 
row_height  = DED l {{������  ��  E FGF l {{��H��  H 3 - Make sure the correct workbook is active and   G IJI l {{��K��  K * $ that the correct sheet is selected.   J LML r  {�NON l {�P��P 5  {���Q��
�� 
X141Q m  �RR  Entourage Contacts   
�� kfrmname��  O o      ���� 0 entourage_workbook  M STS I ����U��
�� .miscactvnull��� ��� nullU o  ������ 0 entourage_workbook  ��  T VWV I ����X�
�� .coreslctnull��� ��� obj X l ��Y�~Y n  ��Z[Z 5  ���}\�|
�} 
X128\ m  ��]]  Contacts   
�| kfrmname[ l ��^�{^ 5  ���z_�y
�z 
X141_ m  ��``  Entourage Contacts   
�y kfrmname�{  �~  �  W aba l ���x�w�x  �w  b cdc l ���ve�v  e D > The number of items in the list object will correspond to the   d fgf l ���uh�u  h 4 . number of contacts that need to be processed.   g iji r  ��klk n  ��mnm 4  ���to
�t 
X244o m  ���s�s n l ��p�rp 5  ���qq�p
�q 
X128q m  ��rr  Contacts   
�p kfrmname�r  l o      �o�o 0 contacts_list  j sts r  ��uvu I ���nw�m
�n .corecnte****       ****w n  ��xyx 2 ���l
�l 
X246y o  ���k�k 0 contacts_list  �m  v o      �j�j 0 num_contacts  t z{z l ���i�h�i  �h  { |}| l ���g~�g  ~ ; 5 Create the button at the top of the worksheet. It is   } � l ���f��f  � B < placed at the top so that if the list object is expanded by   � ��� l ���e��e  � A ; adding new records, the list will not run into the button.   � ��� r  �"��� I ��d�c�
�d .corecrel****      � null�c  � �b��
�b 
kocl� m  ���a
�a 
Xbtn� �`��
�` 
insh� l ����_� n  ����� 5  ���^��]
�^ 
X128� m  ����  Contacts   
�] kfrmname� l ����\� 5  ���[��Z
�[ 
X141� m  ����  Entourage Contacts   
�Z kfrmname�\  �_  � �Y��X
�Y 
prdt� l 	���W� K  ��� �V��
�V 
ptop� m  ���U�U  � �T��
�T 
plft� m  ���S�S  � �R��
�R 
hght� l ���Q� ]  ���� o  ��P�P 0 
row_height  � o  �O�O 0 button_height_in_rows  �Q  � �N��
�N 
pwid� m  �M�M �� �L��K
�L 
1108� m  ��  Update Entourage   �K  �W  �X  � o      �J�J 0 update_button  � ��� l ##�I�H�I  �H  � ��� l ##�G��G  � A ; Assign the script to the on-action property of the button.   � ��� r  #.��� o  #&�F�F ,0 update_button_script Update_button_script� n      ��� 1  )-�E
�E 
BCOa� o  &)�D�D 0 update_button  � ��� l //�C�B�C  �B  � ��� l //�A��A  � B < Make the button active so that the button can be "pressed."   � ��� r  /8��� m  /0�@
�@ boovtrue� n      ��� 1  37�?
�? 
enbl� o  03�>�> 0 update_button  � ��=� l 99�<�;�<  �;  �=  2 m  dgu��  ��  ��  ��   � ��� l     �:�9�:  �9  � ��� l      �8��8  ��� 
	-------------------------------------------------------------------------------
		Function:		delete_Entourage_contact
		
		Description:	 	This function deletes an existing
						 contact from Entourage.
		
		Parameters:
		
			contact_ID		This is a unique ID for a contact in
							Entourage.
							
	-------------------------------------------------------------------------------
	   � ��� i   ~ ���� I      �7��6�7 40 delete_entourage_contact delete_Entourage_contact� ��5� o      �4�4 0 
contact_id 
contact_ID�5  �6  � O     I��� k    H�� ��� l   �3�2�3  �2  � ��� l   �1��1  � &   Get the contact from Entourage.   � ��� r    	��� c    ��� o    �0�0 0 
contact_id 
contact_ID� m    �/
�/ 
long� o      �.�. 0 temp_number  � ��� r   
 ��� 6  
 ��� 2   
 �-
�- 
cAbE� =   ��� 1    �,
�, 
ID  � o    �+�+ 0 temp_number  � o      �*�* 0 	temp_list  � ��� r    ��� n    ��� 4    �)�
�) 
cobj� m    �(�( � o    �'�' 0 	temp_list  � o      �&�& 0 contact_to_delete  � ��%� Q     H���� k   # (�� ��� l  # #�$��$  �   Try to delete it.   � ��#� I  # (�"��!
�" .coredelonull���    obj � o   # $� �  0 contact_to_delete  �!  �#  � R      ���
� .ascrerr ****      � ****� o      �� 0 errmsg errMsg� ���
� 
errn� o      �� 0 errnum errNum� ���
� 
erob� o      �� 0 errfrom errFrom� ���
� 
ptlr� o      �� 0 	errresult 	errResult� ���
� 
errt� o      �� 0 errto errTo�  � k   0 H�� ��� l  0 0���  � ) # If an error occurs, tell the user.   � ��� r   0 ?��� b   0 =	 		  b   0 8			 b   0 6			 m   0 1		 ' !Unable to delete the contact for    	 l  1 5	�	 n   1 5				 4   2 5�	

� 
cobj	
 m   3 4�� 		 o   1 2�� 0 contact_list  �  	 m   6 7		      	 l  8 <	�	 n   8 <			 4   9 <�	
� 
cobj	 m   : ;�� 	 o   8 9�� 0 contact_list  �  � o      �� 0 
error_name  � 			 I  @ E�
	�	
�
 .sysodlogaskr        TEXT	 o   @ A�� 0 
error_name  �	  	 	�	 L   F H��  �  �%  � m     �� 			 l     ���  �  	 			 l      �	�  	�� 
	-------------------------------------------------------------------------------
		Function:		create_new_contact
		
		Description:	This function creates a new contact in
					Entourage. It is called the 
					process_Entourage_Contact function.
					
		Parameters:
			contact_list		This is a list containing all of
							the data that should be put into
							the new contact.
	-------------------------------------------------------------------------------
	   	 			 i   � �			 I      �	�� 0 create_new_contact  	 	� 	 o      ���� 0 contact_list  �   �  	 O    �		 	 k   �	!	! 	"	#	" l   ������  ��  	# 	$	%	$ l   ��	&��  	& C = Try to create a new contact in Entourage. Use the properties   	% 	'	(	' l   ��	)��  	) > 8 parameter of the make new command to set the properties   	( 	*	+	* l   ��	,��  	, A ; of the new contact with the data that was passed in by the   	+ 	-	.	- l   ��	/��  	/   contact_list parameter.   	. 	0	1	0 Q    P	2	3	4	2 r    ,	5	6	5 I   *����	7
�� .corecrel****      � null��  	7 ��	8	9
�� 
kocl	8 m   	 
��
�� 
cAbE	9 ��	:��
�� 
prdt	: l 	  &	;��	; K    &	<	< ��	=	>
�� 
pFrN	= l   	?��	? n    	@	A	@ 4    ��	B
�� 
cobj	B m    ���� 	A o    ���� 0 contact_list  ��  	> ��	C	D
�� 
pLsN	C l   	E��	E n    	F	G	F 4    ��	H
�� 
cobj	H m    ���� 	G o    ���� 0 contact_list  ��  	D ��	I	J
�� 
hmNm	I l   	K��	K n    	L	M	L 4    ��	N
�� 
cobj	N m    ���� 	M o    ���� 0 contact_list  ��  	J ��	O	P
�� 
mbNm	O l   	Q��	Q n    	R	S	R 4    ��	T
�� 
cobj	T m    ���� 		S o    ���� 0 contact_list  ��  	P ��	U��
�� 
bsNm	U l    $	V��	V n     $	W	X	W 4   ! $��	Y
�� 
cobj	Y m   " #���� 	X o     !���� 0 contact_list  ��  ��  ��  ��  	6 o      ���� 0 new_contact  	3 R      ��	Z	[
�� .ascrerr ****      � ****	Z o      ���� 0 errmsg errMsg	[ ��	\	]
�� 
errn	\ o      ���� 0 errnum errNum	] ��	^	_
�� 
erob	^ o      ���� 0 errfrom errFrom	_ ��	`	a
�� 
ptlr	` o      ���� 0 	errresult 	errResult	a ��	b��
�� 
errt	b o      ���� 0 errto errTo��  	4 k   4 P	c	c 	d	e	d l  4 4��	f��  	f + % If an error occurs, tell the user.     	e 	g	h	g l  4 4��	i��  	i [ U Item 1 is the first name of the contact, and item 2 is the last name of the contact.   	h 	j	k	j r   4 G	l	m	l b   4 E	n	o	n b   4 @	p	q	p b   4 <	r	s	r m   4 7	t	t % Unable to create a contact for    	s l  7 ;	u��	u n   7 ;	v	w	v 4   8 ;��	x
�� 
cobj	x m   9 :���� 	w o   7 8���� 0 contact_list  ��  	q m   < ?	y	y      	o l  @ D	z��	z n   @ D	{	|	{ 4   A D��	}
�� 
cobj	} m   B C���� 	| o   @ A���� 0 contact_list  ��  	m o      ���� 0 
error_name  	k 	~		~ I  H M��	���
�� .sysodlogaskr        TEXT	� o   H I���� 0 
error_name  ��  	 	�	�	� l  N N������  ��  	� 	�	�	� l  N N��	���  	� 2 , After warning the user, leave this routine.   	� 	���	� L   N P����  ��  	1 	�	�	� l  Q Q������  ��  	� 	�	�	� l  Q Q��	���  	� 8 2 The home address field of an Entourage contact is   	� 	�	�	� l  Q Q��	���  	� ; 5 itself a record. This code will retrieve that record   	� 	�	�	� l  Q Q��	���  	� < 6 and use the data that was passed in the contact_list    	� 	�	�	� l  Q Q��	���  	� ; 5 parameter to update the home address record for this   	� 	�	�	� l  Q Q��	���  	�   new contact.   	� 	�	�	� r   Q X	�	�	� n   Q V	�	�	� 1   R V��
�� 
hmAd	� o   Q R���� 0 new_contact  	� o      ���� 0 home_address  	� 	�	�	� r   Y c	�	�	� l  Y ]	���	� n   Y ]	�	�	� 4   Z ]��	�
�� 
cobj	� m   [ \���� 	� o   Y Z���� 0 contact_list  ��  	� l     	���	� n      	�	�	� 1   ^ b��
�� 
PAST	� o   ] ^���� 0 home_address  ��  	� 	�	�	� r   d n	�	�	� l  d h	���	� n   d h	�	�	� 4   e h��	�
�� 
cobj	� m   f g���� 	� o   d e���� 0 contact_list  ��  	� l     	���	� n      	�	�	� 1   i m��
�� 
PACY	� o   h i���� 0 home_address  ��  	� 	�	�	� r   o {	�	�	� l  o u	���	� n   o u	�	�	� 4   p u��	�
�� 
cobj	� m   q t���� 	� o   o p���� 0 contact_list  ��  	� l     	���	� n      	�	�	� 1   v z��
�� 
PASE	� o   u v���� 0 home_address  ��  	� 	�	�	� r   | �	�	�	� l  | �	���	� n   | �	�	�	� 4   } ���	�
�� 
cobj	� m   ~ ����� 	� o   | }���� 0 contact_list  ��  	� l     	���	� n      	�	�	� 1   � ���
�� 
PAZP	� o   � ����� 0 home_address  ��  	� 	�	�	� r   � �	�	�	� l  � �	���	� n   � �	�	�	� 4   � ���	�
�� 
cobj	� m   � ����� 	� o   � ����� 0 contact_list  ��  	� l     	���	� n      	�	�	� 1   � ���
�� 
PACT	� o   � ����� 0 home_address  ��  	� 	�	�	� r   � �	�	�	� o   � ����� 0 home_address  	� n      	�	�	� 1   � ���
�� 
hmAd	� o   � ����� 0 new_contact  	� 	�	�	� l  � �������  ��  	� 	�	�	� l  � ���	���  	� < 6 The business address field of an Entourage contact is   	� 	�	�	� l  � ���	���  	� ; 5 itself a record. This code will retrieve that record   	� 	�	�	� l  � ���	���  	� < 6 and use the data that was passed in the contact_list    	� 	�	�	� l  � ���	���  	� ? 9 parameter to update the business address record for this   	� 	�	�	� l  � ���	���  	�   new contact.   	� 	�	�	� r   � �	�	�	� n   � �	�	�	� 1   � ���
�� 
bsAd	� o   � ����� 0 new_contact  	� o      �� 0 business_address  	� 	�	�	� r   � �	�	�	� l  � �	��~	� n   � �	�	�	� 4   � ��}	�
�} 
cobj	� m   � ��|�| 	� o   � ��{�{ 0 contact_list  �~  	� l     	��z	� n      	�	�	� 1   � ��y
�y 
PAST	� o   � ��x�x 0 business_address  �z  	� 	�	�	� r   � �	�
 	� l  � �
�w
 n   � �


 4   � ��v

�v 
cobj
 m   � ��u�u 
 o   � ��t�t 0 contact_list  �w  
  l     
�s
 n      


 1   � ��r
�r 
PACY
 o   � ��q�q 0 business_address  �s  	� 

	
 r   � �




 l  � �
�p
 n   � �


 4   � ��o

�o 
cobj
 m   � ��n�n 
 o   � ��m�m 0 contact_list  �p  
 l     
�l
 n      


 1   � ��k
�k 
PASE
 o   � ��j�j 0 business_address  �l  
	 


 r   � �


 l  � �
�i
 n   � �


 4   � ��h

�h 
cobj
 m   � ��g�g 
 o   � ��f�f 0 contact_list  �i  
 l     
�e
 n      


 1   � ��d
�d 
PAZP
 o   � ��c�c 0 business_address  �e  
 


 r   � �
 
!
  l  � �
"�b
" n   � �
#
$
# 4   � ��a
%
�a 
cobj
% m   � ��`�` 
$ o   � ��_�_ 0 contact_list  �b  
! l     
&�^
& n      
'
(
' 1   � ��]
�] 
PACT
( o   � ��\�\ 0 business_address  �^  
 
)
*
) r   � �
+
,
+ o   � ��[�[ 0 business_address  
, n      
-
.
- 1   � ��Z
�Z 
bsAd
. o   � ��Y�Y 0 new_contact  
* 
/
0
/ l  � ��X�W�X  �W  
0 
1
2
1 l  � ��V
3�V  
3 ? 9 The e-mail address is an element of a contact. If a home   
2 
4
5
4 l  � ��U
6�U  
6 9 3 e-mail address is part of the data provided by the   
5 
7
8
7 l  � ��T
9�T  
9 ? 9 contact_list parameter, then create a new e-mail address   
8 
:
;
: l  � ��S
<�S  
<   for this contact.   
; 
=
>
= Z   �D
?
@�R�Q
? >  � �
A
B
A m   � �
C
C      
B l  � �
D�P
D n   � �
E
F
E 4   � ��O
G
�O 
cobj
G m   � ��N�N 

F o   � ��M�M 0 contact_list  �P  
@ Q   �@
H
I
J
H r   �
K
L
K I  ��L�K
M
�L .corecrel****      � null�K  
M �J
N
O
�J 
kocl
N m   ��I
�I 
cEmA
O �H
P
Q
�H 
insh
P l 
R�G
R n  
S
T
S  :  
T o  �F�F 0 new_contact  �G  
Q �E
U�D
�E 
prdt
U l 	
V�C
V K  
W
W �B
X
Y
�B 
pcnt
X l 
Z�A
Z n  
[
\
[ 4  �@
]
�@ 
cobj
] m  �?�? 

\ o  �>�> 0 contact_list  �A  
Y �=
^�<
�= 
clbl
^ m  �;
�; ePATeHme�<  �C  �D  
L o      �:�: 0 
home_email  
I R      �9
_
`
�9 .ascrerr ****      � ****
_ o      �8�8 0 errmsg errMsg
` �7
a
b
�7 
errn
a o      �6�6 0 errnum errNum
b �5
c
d
�5 
erob
c o      �4�4 0 errfrom errFrom
d �3
e
f
�3 
ptlr
e o      �2�2 0 	errresult 	errResult
f �1
g�0
�1 
errt
g o      �/�/ 0 errto errTo�0  
J k  '@
h
h 
i
j
i l ''�.�-�.  �-  
j 
k
l
k l ''�,
m�,  
m E ? If an error occurs, warn the user, but continue to process the   
l 
n
o
n l ''�+
p�+  
p   rest of the data.   
o 
q
r
q r  ':
s
t
s b  '8
u
v
u b  '3
w
x
w b  '/
y
z
y m  '*
{
{ 0 *Unable to create a home email address for    
z l *.
|�*
| n  *.
}
~
} 4  +.�)

�) 
cobj
 m  ,-�(�( 
~ o  *+�'�' 0 contact_list  �*  
x m  /2
�
�      
v l 37
��&
� n  37
�
�
� 4  47�%
�
�% 
cobj
� m  56�$�$ 
� o  34�#�# 0 contact_list  �&  
t o      �"�" 0 
error_name  
r 
��!
� I ;@� 
��
�  .sysodlogaskr        TEXT
� o  ;<�� 0 
error_name  �  �!  �R  �Q  
> 
�
�
� l EE���  �  
� 
�
�
� l EE�
��  
� ? 9 The e-mail address is an element of a contact. If a work   
� 
�
�
� l EE�
��  
� 9 3 e-mail address is part of the data provided by the   
� 
�
�
� l EE�
��  
� ? 9 contact_list parameter, then create a new e-mail address   
� 
�
�
� l EE�
��  
�   for this contact.   
� 
��
� Z  E�
�
���
� > EO
�
�
� m  EH
�
�      
� l HN
��
� n  HN
�
�
� 4  IN�
�
� 
cobj
� m  JM�� 
� o  HI�� 0 contact_list  �  
� Q  R�
�
�
�
� r  Uy
�
�
� I Uw��
�
� .corecrel****      � null�  
� �
�
�
� 
kocl
� m  WZ�
� 
cEmA
� �
�
�
� 
insh
� l ]_
��
� n  ]_
�
�
�  :  ^_
� o  ]^�
�
 0 new_contact  �  
� �	
��
�	 
prdt
� l 	`q
��
� K  `q
�
� �
�
�
� 
pcnt
� l ci
��
� n  ci
�
�
� 4  di�
�
� 
cobj
� m  eh�� 
� o  cd�� 0 contact_list  �  
� �
�� 
� 
clbl
� m  lo��
�� ePATeWrk�   �  �  
� o      ���� 0 
work_email  
� R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 errmsg errMsg
� ��
�
�
�� 
errn
� o      ���� 0 errnum errNum
� ��
�
�
�� 
erob
� o      ���� 0 errfrom errFrom
� ��
�
�
�� 
ptlr
� o      ���� 0 	errresult 	errResult
� ��
���
�� 
errt
� o      ���� 0 errto errTo��  
� k  ��
�
� 
�
�
� l ��������  ��  
� 
�
�
� l ����
���  
� E ? If an error occurs, warn the user, but continue to process the   
� 
�
�
� l ����
���  
�   rest of the data   
� 
�
�
� r  ��
�
�
� b  ��
�
�
� b  ��
�
�
� b  ��
�
�
� m  ��
�
� 0 *Unable to create a work email address for    
� l ��
���
� n  ��
�
�
� 4  ����
�
�� 
cobj
� m  ������ 
� o  ������ 0 contact_list  ��  
� m  ��
�
�      
� l ��
���
� n  ��
�
�
� 4  ����
�
�� 
cobj
� m  ������ 
� o  ������ 0 contact_list  ��  
� o      ���� 0 
error_name  
� 
���
� I ����
���
�� .sysodlogaskr        TEXT
� o  ������ 0 
error_name  ��  ��  �  �  �  	  m     �	 
�
�
� l     ������  ��  
� 
�
�
� l      ��
���  
��} 
	-------------------------------------------------------------------------------
		Function:		process_Entourage_Contact
		
		Description:	 	This function takes 
						the data that was in the Excel list
						object and a contact ID and checks whether the
						data in the Entourage contact with
						the same contact ID 
						has been changed.
					
		Parameters:
			contact_list		This list contains all of
							the data that should be put into
							the new contact.
							
			contact_ID		This is a unique ID for a contact in
							Entourage.
	-------------------------------------------------------------------------------
	   
� 
�
�
� i   � �
�
�
� I      ��
����� 60 process_entourage_contact process_Entourage_Contact
� 
�
�
� o      ���� 0 contact_list  
� 
���
� o      ���� 0 
contact_id 
contact_ID��  ��  
� k    �
�
� 
�
�
� l     ������  ��  
� 
���
� O    �
�
�
� k   �
�
� 
�
�
� l   ������  ��  
� 
�
�
� l   ��
���  
� 3 - If the contact_ID is NULL, then this contact   
� 
�
�
� l   ��
���  
� / ) data was added to the list object and is   
� 
�
�
� l   ��
���  
� 4 . not in Entourage. Call the create_new_contact   
� 
�
�
� l   ��
���  
� ' ! function to add the new contact.   
�    Z    ���� =    o    ���� 0 
contact_id 
contact_ID m           k   
  	 O  
 

 I    ������ 0 create_new_contact   �� o    ���� 0 contact_list  ��  ��    f   
 	 �� L    ����  ��  ��  ��    l   ������  ��    l   ����   3 - Get the corresponding contact from Entourage     l   ����   2 , so that its data can be checked against the     l   ����   0 * data that the Excel list has for the same     l   ����    	 contact.     Q    [ ! k     ;"" #$# l     ��%��  % &   Convert the ID to a number, and   $ &'& l     ��(��  ( + % request that contact from Entourage.   ' )*) r     %+,+ c     #-.- o     !���� 0 
contact_id 
contact_ID. m   ! "��
�� 
long, o      ���� 0 temp_number  * /0/ r   & 4121 6  & 2343 2   & )��
�� 
cAbE4 =  * 1565 1   + -��
�� 
ID  6 o   . 0���� 0 temp_number  2 o      ���� 0 	temp_list  0 7��7 r   5 ;898 n   5 9:;: 4   6 9��<
�� 
cobj< m   7 8���� ; o   5 6���� 0 	temp_list  9 o      ���� 0 contact_to_process  ��    R      ��=>
�� .ascrerr ****      � ****= o      ���� 0 errmsg errMsg> ��?@
�� 
errn? o      ���� 0 errnum errNum@ ��AB
�� 
erobA o      ���� 0 errfrom errFromB ��CD
�� 
ptlrC o      ���� 0 	errresult 	errResultD ��E��
�� 
errtE o      ���� 0 errto errTo��  ! k   C [FF GHG l  C C��I��  I : 4 If an error occurs, warn the user, and then return.   H JKJ r   C RLML b   C PNON b   C KPQP b   C IRSR m   C DTT &  Unable to process a contact for    S l  D HU��U n   D HVWV 4   E H��X
�� 
cobjX m   F G���� W o   D E���� 0 contact_list  ��  Q m   I JYY      O l  K OZ��Z n   K O[\[ 4   L O��]
�� 
cobj] m   M N���� \ o   K L���� 0 contact_list  ��  M o      ���� 0 
error_name  K ^_^ I  S X��`��
�� .sysodlogaskr        TEXT` o   S T���� 0 
error_name  ��  _ a��a L   Y [����  ��   bcb l  \ \������  ��  c ded l  \ \��f��  f > 8 Check to make sure that the object exists in Entourage.   e ghg l  \ \��i��  i Y S If the object does not exist in Entourage, call the create_new_contact function to   h jkj l  \ \��l��  l ) # create a new contact in Entourage.   k mnm Z   \ rop����o H   \ bqq l  \ ar��r I  \ a��s��
�� .coredoexbool       obj s o   \ ]���� 0 contact_to_process  ��  ��  p k   e ntt uvu I   e k��w���� 0 create_new_contact  w x��x o   f g���� 0 contact_list  ��  ��  v y��y L   l n����  ��  ��  ��  n z{z l  s s������  ��  { |}| l  s s��~��  ~ = 7 Check each item in turn to see whether it has changed.   } � l  s s�����  � 6 0 If it has been changed, update the value in the   � ��� l  s s�����  �   Entourage contact.   � ��� l  s s������  ��  � ��� l  s s�����  �   Check the first name.   � ��� r   s x��� n   s v��� 1   t v��
�� 
pFrN� o   s t�� 0 contact_to_process  � o      �~�~ 0 original_item  � ��� r   y ��� l  y }��}� n   y }��� 4   z }�|�
�| 
cobj� m   { |�{�{ � o   y z�z�z 0 contact_list  �}  � o      �y�y 0 
excel_item 
Excel_item� ��� Z   � ����x�w� >  � ���� o   � ��v�v 0 original_item  � o   � ��u�u 0 
excel_item 
Excel_item� r   � ���� o   � ��t�t 0 
excel_item 
Excel_item� n      ��� 1   � ��s
�s 
pFrN� o   � ��r�r 0 contact_to_process  �x  �w  � ��� l  � ��q�p�q  �p  � ��� l  � ��o��o  �   Check the last name.   � ��� r   � ���� n   � ���� 1   � ��n
�n 
pLsN� o   � ��m�m 0 contact_to_process  � o      �l�l 0 original_item  � ��� r   � ���� l  � ���k� n   � ���� 4   � ��j�
�j 
cobj� m   � ��i�i � o   � ��h�h 0 contact_list  �k  � o      �g�g 0 
excel_item 
Excel_item� ��� Z   � ����f�e� >  � ���� o   � ��d�d 0 original_item  � o   � ��c�c 0 
excel_item 
Excel_item� r   � ���� o   � ��b�b 0 
excel_item 
Excel_item� n      ��� 1   � ��a
�a 
pLsN� o   � ��`�` 0 contact_to_process  �f  �e  � ��� l  � ��_�^�_  �^  � ��� l  � ��]��]  �   Check the home address.   � ��� r   � ���� n   � ���� 1   � ��\
�\ 
hmAd� o   � ��[�[ 0 contact_to_process  � o      �Z�Z 0 original_address  � ��� l  � ��Y�X�Y  �X  � ��� l  � ��W��W  � %  Check the home street address.   � ��� r   � ���� n   � ���� 1   � ��V
�V 
PAST� o   � ��U�U 0 original_address  � o      �T�T 0 original_item  � ��� r   � ���� l  � ���S� n   � ���� 4   � ��R�
�R 
cobj� m   � ��Q�Q � o   � ��P�P 0 contact_list  �S  � o      �O�O 0 
excel_item 
Excel_item� ��� Z   � ����N�M� >  � ���� o   � ��L�L 0 original_item  � o   � ��K�K 0 
excel_item 
Excel_item� r   � ���� o   � ��J�J 0 
excel_item 
Excel_item� n      ��� 1   � ��I
�I 
PAST� o   � ��H�H 0 original_address  �N  �M  � ��� l  � ��G�F�G  �F  � ��� l  � ��E��E  �   Check the home city.   � ��� r   � ���� n   � ���� 1   � ��D
�D 
PACY� o   � ��C�C 0 original_address  � o      �B�B 0 original_item  � ��� r   � ���� l  � ���A� n   � ���� 4   � ��@�
�@ 
cobj� m   � ��?�? � o   � ��>�> 0 contact_list  �A  � o      �=�= 0 
excel_item 
Excel_item� ��� Z   � ����<�;� >  � ���� o   � ��:�: 0 original_item  � o   � ��9�9 0 
excel_item 
Excel_item� r   � �   o   � ��8�8 0 
excel_item 
Excel_item n       1   � ��7
�7 
PACY o   � ��6�6 0 original_address  �<  �;  �  l  � ��5�4�5  �4    l  � ��3�3     Check the home state.    	
	 r   �  n   � � 1   � ��2
�2 
PASE o   � ��1�1 0 original_address   o      �0�0 0 original_item  
  r  	 l �/ n   4  �.
�. 
cobj m  �-�-  o  �,�, 0 contact_list  �/   o      �+�+ 0 
excel_item 
Excel_item  Z  
�*�) > 
 o  
�(�( 0 original_item   o  �'�' 0 
excel_item 
Excel_item r   o  �&�& 0 
excel_item 
Excel_item n        1  �%
�% 
PASE  o  �$�$ 0 original_address  �*  �)   !"! l �#�"�#  �"  " #$# l �!%�!  %   Check the home ZIP code.   $ &'& r  #()( n  !*+* 1  !� 
�  
PAZP+ o  �� 0 original_address  ) o      �� 0 original_item  ' ,-, r  $,./. l $*0�0 n  $*121 4  %*�3
� 
cobj3 m  &)�� 2 o  $%�� 0 contact_list  �  / o      �� 0 
excel_item 
Excel_item- 454 Z  ->67��6 > -0898 o  -.�� 0 original_item  9 o  ./�� 0 
excel_item 
Excel_item7 r  3::;: o  34�� 0 
excel_item 
Excel_item; n      <=< 1  59�
� 
PAZP= o  45�� 0 original_address  �  �  5 >?> l ??���  �  ? @A@ l ??�B�  B   Check the home country.   A CDC r  ?FEFE n  ?DGHG 1  @D�
� 
PACTH o  ?@�� 0 original_address  F o      �� 0 original_item  D IJI r  GOKLK l GMM�M n  GMNON 4  HM�
P
�
 
cobjP m  IL�	�	 O o  GH�� 0 contact_list  �  L o      �� 0 
excel_item 
Excel_itemJ QRQ Z  PaST��S > PSUVU o  PQ�� 0 original_item  V o  QR�� 0 
excel_item 
Excel_itemT r  V]WXW o  VW�� 0 
excel_item 
Excel_itemX n      YZY 1  X\�
� 
PACTZ o  WX� �  0 original_address  �  �  R [\[ l bb������  ��  \ ]^] l bb��_��  _ * $ Addresses in Entourage are records.   ^ `a` l bb��b��  b , & Retrieve the home address record from   a cdc l bb��e��  e 3 - Entourage, and check each item in the record   d fgf l bb��h��  h ) # with the data in the contact_list.   g iji r  biklk o  bc���� 0 original_address  l n      mnm 1  dh��
�� 
hmAdn o  cd���� 0 contact_to_process  j opo l jj������  ��  p qrq l jj��s��  s #  Check the home phone number.   r tut r  jqvwv n  joxyx 1  ko��
�� 
hmNmy o  jk���� 0 contact_to_process  w o      ���� 0 original_item  u z{z r  rz|}| l rx~��~ n  rx� 4  sx���
�� 
cobj� m  tw���� � o  rs���� 0 contact_list  ��  } o      ���� 0 
excel_item 
Excel_item{ ��� Z  {�������� > {~��� o  {|���� 0 original_item  � o  |}���� 0 
excel_item 
Excel_item� r  ����� o  ������ 0 
excel_item 
Excel_item� n      ��� 1  ����
�� 
hmNm� o  ������ 0 contact_to_process  ��  ��  � ��� l ��������  ��  � ��� l �������  � %  Check the mobile phone number.   � ��� r  ����� n  ����� 1  ����
�� 
hmNm� o  ������ 0 contact_to_process  � o      ���� 0 original_item  � ��� r  ����� l ������ n  ����� 4  �����
�� 
cobj� m  ������ 	� o  ������ 0 contact_list  ��  � o      ���� 0 
excel_item 
Excel_item� ��� Z  ��������� > ����� o  ������ 0 original_item  � o  ������ 0 
excel_item 
Excel_item� r  ����� o  ������ 0 
excel_item 
Excel_item� n      ��� 1  ����
�� 
mbNm� o  ������ 0 contact_to_process  ��  ��  � ��� l ��������  ��  � ��� l �������  � %  Check the home e-mail address.   � ��� l �������  � ? 9 Note: This is NOT an accurate way to do this, given that   � ��� l �������  � 8 2 a user may have multiple "home" e-mail addresses.   � ��� l �������  � 7 1 This code will ASSUME that the user has only one   � ��� l �������  � 4 . home e-mail address. It will update the first   � ��� l �������  � 6 0 home e-mail address found to the value that was   � ��� l �������  �    in the Excel list object.   � ��� r  ����� I �������
�� .corecnte****       ****� n  ����� 2 ����
�� 
cEmA� o  ������ 0 contact_to_process  ��  � o      ���� 0 cnt_eaddress cnt_EAddress� ��� r  ����� m  ����
�� boovfals� o      ���� 0 found_address  � ��� Y  ��������� k  ��� ��� r  ����� n  ����� 1  ����
�� 
qpro� n  ����� 4  �����
�� 
cEmA� o  ������ 0 i  � o  ������ 0 contact_to_process  � o      ���� 0 cur_eaddress cur_EAddress� ���� Z  �������� = ����� n  ����� 1  ����
�� 
clbl� o  ������ 0 cur_eaddress cur_EAddress� m  ����
�� ePATeHme� k  ��� ��� r  ����� m  ����
�� boovtrue� o      ���� 0 found_address  � ��� r  ����� n  ����� 1  ����
�� 
pcnt� o  ������ 0 cur_eaddress cur_EAddress� o      ���� 0 original_item  � ��� r  ����� l ������ n  ����� 4  �����
�� 
cobj� m  ������ 
� o  ������ 0 contact_list  ��  � o      ���� 0 
excel_item 
Excel_item� ��� Z   ������� >  ��� o   ���� 0 original_item  � o  ���� 0 
excel_item 
Excel_item� r  ��� o  ���� 0 
excel_item 
Excel_item� n      ��� 1  
��
�� 
pcnt� o  
���� 0 cur_eaddress cur_EAddress��  ��  � ����  S  ��  ��  ��  ��  �� 0 i  � m  ������ � o  ������ 0 cnt_eaddress cnt_EAddress��  � � � l ������  ��     Z  `���� H  ! o   ���� 0 found_address   Q  $\ k  'S		 

 l ''����   < 6 If a home e-mail address could not be found, create a     l ''����   ? 9 new e-mail address with the appropriate property values.    �� r  'S I 'O����
�� .corecrel****      � null��   ��
�� 
kocl m  +.��
�� 
cEmA ��
�� 
insh l 13�� n  13  :  23 o  12���� 0 contact_to_process  ��   ����
�� 
prdt l 	6I�� K  6I ��
�� 
pcnt l 9? ��  n  9?!"! 4  :?��#
�� 
cobj# m  ;>���� 
" o  9:���� 0 contact_list  ��   ��$��
�� 
clbl$ m  BE��
�� ePATeHme��  ��  ��   o      ���� 0 
home_email  ��   R      ��%&
�� .ascrerr ****      � ****% o      ���� 0 errmsg errMsg& ��'(
�� 
errn' o      ���� 0 errnum errNum( ��)*
�� 
erob) o      ���� 0 errfrom errFrom* ��+,
�� 
ptlr+ o      �� 0 	errresult 	errResult, �~-�}
�~ 
errt- o      �|�| 0 errto errTo�}   l [[�{�z�{  �z  ��  ��   ./. l aa�y�x�y  �x  / 010 l aa�w2�w  2 * $ Addresses in Entourage are records.   1 343 l aa�v5�v  5 0 * Retrieve the business address record from   4 676 l aa�u8�u  8 3 - Entourage, and check each item in the record   7 9:9 l aa�t;�t  ; ) # with the data in the contact_list.   : <=< r  ah>?> n  af@A@ 1  bf�s
�s 
bsAdA o  ab�r�r 0 contact_to_process  ? o      �q�q 0 original_address  = BCB l ii�p�o�p  �o  C DED l ii�nF�n  F ) # Check the business street address.   E GHG r  ipIJI n  inKLK 1  jn�m
�m 
PASTL o  ij�l�l 0 original_address  J o      �k�k 0 original_item  H MNM r  qyOPO l qwQ�jQ n  qwRSR 4  rw�iT
�i 
cobjT m  sv�h�h S o  qr�g�g 0 contact_list  �j  P o      �f�f 0 
excel_item 
Excel_itemN UVU Z  z�WX�e�dW > z}YZY o  z{�c�c 0 original_item  Z o  {|�b�b 0 
excel_item 
Excel_itemX r  ��[\[ o  ���a�a 0 
excel_item 
Excel_item\ n      ]^] 1  ���`
�` 
PAST^ o  ���_�_ 0 original_address  �e  �d  V _`_ l ���^�]�^  �]  ` aba l ���\c�\  c   Check the business city.   b ded r  ��fgf n  ��hih 1  ���[
�[ 
PACYi o  ���Z�Z 0 original_address  g o      �Y�Y 0 original_item  e jkj r  ��lml l ��n�Xn n  ��opo 4  ���Wq
�W 
cobjq m  ���V�V p o  ���U�U 0 contact_list  �X  m o      �T�T 0 
excel_item 
Excel_itemk rsr Z  ��tu�S�Rt > ��vwv o  ���Q�Q 0 original_item  w o  ���P�P 0 
excel_item 
Excel_itemu r  ��xyx o  ���O�O 0 
excel_item 
Excel_itemy n      z{z 1  ���N
�N 
PACY{ o  ���M�M 0 original_address  �S  �R  s |}| l ���L�K�L  �K  } ~~ l ���J��J  �    Check the business state.    ��� r  ����� n  ����� 1  ���I
�I 
PASE� o  ���H�H 0 original_address  � o      �G�G 0 original_item  � ��� r  ����� l ����F� n  ����� 4  ���E�
�E 
cobj� m  ���D�D � o  ���C�C 0 contact_list  �F  � o      �B�B 0 
excel_item 
Excel_item� ��� Z  �����A�@� > ����� o  ���?�? 0 original_item  � o  ���>�> 0 
excel_item 
Excel_item� r  ����� o  ���=�= 0 
excel_item 
Excel_item� n      ��� 1  ���<
�< 
PASE� o  ���;�; 0 original_address  �A  �@  � ��� l ���:�9�:  �9  � ��� l ���8��8  � #  Check the business ZIP code.   � ��� r  ����� n  ����� 1  ���7
�7 
PAZP� o  ���6�6 0 original_address  � o      �5�5 0 original_item  � ��� r  ����� l ����4� n  ����� 4  ���3�
�3 
cobj� m  ���2�2 � o  ���1�1 0 contact_list  �4  � o      �0�0 0 
excel_item 
Excel_item� ��� Z  �����/�.� > ����� o  ���-�- 0 original_item  � o  ���,�, 0 
excel_item 
Excel_item� r  ����� o  ���+�+ 0 
excel_item 
Excel_item� n      ��� 1  ���*
�* 
PAZP� o  ���)�) 0 original_address  �/  �.  � ��� l ���(�'�(  �'  � ��� l ���&��&  � "  Check the business country.   � ��� r  ����� n  ����� 1  ���%
�% 
PACT� o  ���$�$ 0 original_address  � o      �#�# 0 original_item  � ��� r  ���� l ���"� n  ���� 4  ��!�
�! 
cobj� m  �� �  � o  ���� 0 contact_list  �"  � o      �� 0 
excel_item 
Excel_item� ��� Z  ����� > 	��� o  �� 0 original_item  � o  �� 0 
excel_item 
Excel_item� r  ��� o  �� 0 
excel_item 
Excel_item� n      ��� 1  �
� 
PACT� o  �� 0 original_address  �  �  � ��� l ���  �  � ��� r  ��� o  �� 0 original_address  � n      ��� 1  �
� 
bsAd� o  �� 0 contact_to_process  � ��� l   ���  �  � ��� l   ���  � ' ! Check the business phone number.   � ��� r   '��� n   %��� 1  !%�
� 
bsNm� o   !�� 0 contact_to_process  � o      �� 0 original_item  � ��� r  (0��� l (.��� n  (.��� 4  ).�
�
�
 
cobj� m  *-�	�	 � o  ()�� 0 contact_list  �  � o      �� 0 
excel_item 
Excel_item� ��� Z  1B����� > 14��� o  12�� 0 original_item  � o  23�� 0 
excel_item 
Excel_item� r  7>��� o  78�� 0 
excel_item 
Excel_item� n      ��� 1  9=�
� 
bsNm� o  89� �  0 contact_to_process  �  �  � ��� l CC������  ��  � ��� l CC�����  � %  Check the work e-mail address.   � ��� l CC�����  � ? 9 Note: This is NOT an accurate way to do this, given that   �    l CC����   8 2 a user may have multiple "work" e-mail addresses.     l CC����   7 1 This code will ASSUME that the user has only one     l CC����   4 . work e-mail address. It will update the first    	
	 l CC����   6 0 work e-mail address found to the value that was   
  l CC����      in the Excel list object.     r  CN I CL����
�� .corecnte****       **** n  CH 2 DH��
�� 
cEmA o  CD���� 0 contact_to_process  ��   o      ���� 0 cnt_eaddress cnt_EAddress  r  OR m  OP��
�� boovfals o      ���� 0 found_address    Y  S����� k  ]�  !  r  ]m"#" n  ]i$%$ 1  ei��
�� 
qpro% n  ]e&'& 4  ^e��(
�� 
cEmA( o  ad���� 0 i  ' o  ]^���� 0 contact_to_process  # o      ���� 0 cur_eaddress cur_EAddress! )��) Z  n�*+����* = ny,-, n  nu./. 1  qu��
�� 
clbl/ o  nq���� 0 cur_eaddress cur_EAddress- m  ux��
�� ePATeWrk+ k  |�00 121 r  |343 m  |}��
�� boovtrue4 o      ���� 0 found_address  2 565 r  ��787 n  ��9:9 1  ����
�� 
pcnt: o  ������ 0 cur_eaddress cur_EAddress8 o      ���� 0 original_item  6 ;<; r  ��=>= l ��?��? n  ��@A@ 4  ����B
�� 
cobjB m  ������ A o  ������ 0 contact_list  ��  > o      ���� 0 
excel_item 
Excel_item< CDC Z  ��EF����E > ��GHG o  ������ 0 original_item  H o  ������ 0 
excel_item 
Excel_itemF r  ��IJI o  ������ 0 
excel_item 
Excel_itemJ n      KLK 1  ����
�� 
pcntL o  ������ 0 cur_eaddress cur_EAddress��  ��  D M��M  S  ����  ��  ��  ��  �� 0 i   m  VW����  o  WX���� 0 cnt_eaddress cnt_EAddress��   NON l ��������  ��  O PQP Z  ��RS����R H  ��TT o  ������ 0 found_address  S Q  ��UVWU k  ��XX YZY l ����[��  [ < 6 If a work e-mail address could not be found, create a   Z \]\ l ����^��  ^ ? 9 new e-mail address with the appropriate property values.   ] _��_ r  ��`a` I ������b
�� .corecrel****      � null��  b ��cd
�� 
koclc m  ����
�� 
cEmAd ��ef
�� 
inshe l ��g��g n  ��hih  :  ��i o  ������ 0 contact_to_process  ��  f ��j��
�� 
prdtj l 	��k��k K  ��ll ��mn
�� 
pcntm l ��o��o n  ��pqp 4  ����r
�� 
cobjr m  ������ q o  ������ 0 contact_list  ��  n ��s��
�� 
clbls m  ����
�� ePATeWrk��  ��  ��  a o      ���� 0 
home_email  ��  V R      ��tu
�� .ascrerr ****      � ****t o      ���� 0 errmsg errMsgu ��vw
�� 
errnv o      ���� 0 errnum errNumw ��xy
�� 
erobx o      ���� 0 errfrom errFromy ��z{
�� 
ptlrz o      ���� 0 	errresult 	errResult{ ��|��
�� 
errt| o      ���� 0 errto errTo��  W k  ��}} ~~ l �������  � � } Set error_name to "Unable to create a work e-mail address for " & (item 1 of contact_list) & " " & (item 2 of contact_list).    ���� l �������  � !  Display dialog error_name.   ��  ��  ��  Q ���� l ��������  ��  ��  
� m     ���  
� ��� l     ������  ��  � ��� l      �����  �5/ 
	-------------------------------------------------------------------------------
		Function:		update_from_Excel_to_Entourage
		
		Description:		This is the "main" routine that
						is called when it is time to upload
						the data in the Excel list object 
						back into Entourage contacts. It 
						can be called either by running this
						script after the list object has been
						created, or by clicking the
						Update Entourage button on the worksheet.
					
		-------------------------------------------------------------------------------
	   � ��� i   � ���� I      �������� @0 update_from_excel_to_entourage update_from_Excel_to_Entourage��  ��  � k    1�� ��� O    )��� k   (�� ��� l   ������  ��  � ��� l   �����  � 8 2 Get the Entourage contacts workbook and make sure   � ��� l   �����  � !  it is the active workbook.   � ��� r    ��� l   	���� 5    	�����
�� 
X141� m    ��  Entourage Contacts   
�� kfrmname��  � o      ���� 0 entourage_workbook  � ��� I   �����
�� .miscactvnull��� ��� null� o    ���� 0 entourage_workbook  ��  � ��� l   ������  ��  � ��� l   �����  � 9 3 With the Entourage contacts workbook active, make    � ��� l   �����  � 9 3 sure that the contacts sheet is the topmost sheet.   � ��� I   �����
�� .coreslctnull��� ��� obj � l   ���� 5    �����
�� 
X128� m    ��  Contacts   
�� kfrmname��  ��  � ��� l   ������  ��  � ��� l   �����  � !  Get the number of contacts   � ��� l   �����  � #  that are in the list object.   � ��� r    &��� n    $��� 4   ! $���
�� 
X244� m   " #���� � l   !���� 5    !�����
�� 
X128� m    ��  Contacts   
�� kfrmname��  � o      �� 0 contacts_list  � ��� r   ' 0��� I  ' .�~��}
�~ .corecnte****       ****� n   ' *��� 2  ( *�|
�| 
X246� o   ' (�{�{ 0 contacts_list  �}  � o      �z�z 0 num_contacts  � ��� l  1 1�y�x�y  �x  � ��� l  1 1�w��w  � > 8 The contact_ID_list local variable will hold all of the   � ��� l  1 1�v��v  � > 8 contact IDs that this script processes. It will be used   � ��� l  1 1�u��u  � 5 / to see whether any contacts have been deleted.   � ��� r   1 5��� J   1 3�t�t  � o      �s�s "0 contact_id_list contact_ID_list� ��� l  6 6�r�q�r  �q  � ��� l  6 6�p��p  � ? 9 Compute the row offset for the start of the list object.   � ��� r   6 C��� l  6 A��o� [   6 A��� o   6 ;�n�n 0 button_height_in_rows  � o   ; @�m�m 0 data_offset_from_button  �o  � o      �l�l 0 list_offset  � ��� l  D D�k�j�k  �j  � ��� l  D D�i��i  � 2 , Loop over every contact in the list object.   � ��� Y   D ���h���g� k   N ��� ��� l  N N�f�e�f  �e  � ��� l  N N�d��d  � ? 9 The local variable cur_contact_list will contain all of    � ��� l  N N�c��c  � B < the data that is in the Excel list object for this contact.   � ��� r   N R��� J   N P�b�b  � o      �a�a 0 cur_contact_list  � ��� l  S S�`�_�`  �_  �    l  S S�^�^   M G Fill in the cur_contact_list with the values for this list object row.     Y   S �]�\ k   ] z 	
	 l  ] ]�[�Z�[  �Z  
  l  ] ]�Y�Y   E ? The cell reference will range from "A-R:6-(6 + num_contacts)".     r   ] m c   ] k l  ] i�X b   ] i l  ] e�W n   ] e 4   b e�V
�V 
cobj o   c d�U�U 0 j   o   ] b�T�T &0 excel_column_data Excel_Column_Data�W   l  e h�S [   e h o   e f�R�R 0 i   o   f g�Q�Q 0 list_offset  �S  �X   m   i j�P
�P 
utxt o      �O�O 0 cell_reference    l  n n�N�M�N  �M    !  l  n n�L"�L  " [ U Append the data for this item in the list object row into the cur_contact_list list.   ! #�K# r   n z$%$ b   n x&'& o   n o�J�J 0 cur_contact_list  ' l  o w(�I( n   o w)*) 1   s w�H
�H 
1562* 4   o s�G+
�G 
ccel+ o   q r�F�F 0 cell_reference  �I  % o      �E�E 0 cur_contact_list  �K  �] 0 j   m   V W�D�D  m   W X�C�C �\   ,-, l  � ��B�A�B  �A  - ./. l  � ��@0�@  0 C = The cell reference will range from "R:6-(6 + num_contacts)".   / 121 r   � �343 c   � �565 l  � �7�?7 b   � �898 l  � �:�>: n   � �;<; 4   � ��==
�= 
cobj= m   � ��<�< < o   � ��;�; &0 excel_column_data Excel_Column_Data�>  9 l  � �>�:> [   � �?@? o   � ��9�9 0 i  @ o   � ��8�8 0 list_offset  �:  �?  6 m   � ��7
�7 
utxt4 o      �6�6 0 cell_reference  2 ABA l  � ��5�4�5  �4  B CDC l  � ��3E�3  E @ : Get the contact ID for this contact from the list object.   D FGF r   � �HIH n   � �JKJ 1   � ��2
�2 
1562K 4   � ��1L
�1 
ccelL o   � ��0�0 0 cell_reference  I o      �/�/ 0 
contact_id 
contact_IDG MNM l  � ��.�-�.  �-  N OPO l  � ��,Q�,  Q H B If a contact ID is found, append it to the cur_contact_list list.   P RSR Z   � �TU�+�*T >  � �VWV o   � ��)�) 0 
contact_id 
contact_IDW m   � �XX      U r   � �YZY b   � �[\[ o   � ��(�( "0 contact_id_list contact_ID_list\ o   � ��'�' 0 
contact_id 
contact_IDZ o      �&�& "0 contact_id_list contact_ID_list�+  �*  S ]^] l  � ��%�$�%  �$  ^ _`_ l  � ��#a�#  a E ? Now that all of the updated data for this contact has been put   ` bcb l  � ��"d�"  d I C into the cur_contact_list list, call the process_Entourage_Contact   c efe l  � ��!g�!  g 9 3 function to actually update the data in Entourage.   f h� h O  � �iji I   � ��k�� 60 process_entourage_contact process_Entourage_Contactk lml o   � ��� 0 cur_contact_list  m n�n o   � ��� 0 
contact_id 
contact_ID�  �  j  f   � ��   �h 0 i  � m   G H�� � o   H I�� 0 num_contacts  �g  � opo l  � ����  �  p qrq l  � ��s�  s "  Check for deleted contacts.   r tut l  � ����  �  u vwv l  � ��x�  x L F Get the used range (every cell with a value in it) from the ID sheet.   w yzy r   � �{|{ n   � �}~} 1   � ��
� 
1756~ l  � �� n   � ���� 5   � ����
� 
X128� m   � ���  ID Sheet   
� kfrmname� l  � ���� 5   � ����
� 
X141� m   � ���  Entourage Contacts   
� kfrmname�  �  | o      �� 
0 urange  z ��� l  � ��
�	�
  �	  � ��� l  � ����  � 9 3 Count the number of cells in that range. That will   � ��� l  � ����  � @ : correspond to the number of contacts that were originally   � ��� l  � ����  � ) # imported into this Excel workbook.   � ��� r   � ���� I  � ����
� .corecnte****       ****� n   � ���� 2  � ��
� 
ccel� o   � ��� 
0 urange  �  � o      �� 0 num_contacts  � ��� l  � �� ���   ��  � ��� l  � ������  � ) # Loop over every cell in the range.   � ��� Y   ��������� k   ��� ��� l  � �������  ��  � ��� l  � ������  � C = The cell_reference value will range from "A:1-num_contacts".   � ��� r   � ���� c   � ���� l  � ����� b   � ���� m   � ���  'ID Sheet'!A   � o   � ����� 0 i  ��  � m   � ���
�� 
utxt� o      ���� 0 cell_reference  � ��� l  � �������  ��  � ��� l  � ������  � 1 + Get the original contact ID from the cell.   � ��� r   � ���� l  � ����� n   � ���� 1   � ���
�� 
1562� 4   � ����
�� 
ccel� o   � ����� 0 cell_reference  ��  � l     ���� o      ���� *0 original_contact_id original_contact_ID��  � ��� l  � �������  ��  � ��� l  � ������  � > 8 If this contact ID is no longer in the list of IDs that   � ��� l  � ������  � B < was processed in the Excel list, it must have been deleted.   � ���� Z   �������� H   ��� E   ���� o   � ���� "0 contact_id_list contact_ID_list� o   ���� *0 original_contact_id original_contact_ID� k  �� ��� l ������  ��  � ��� l �����  � > 8 If the ID is missing, call the delete_Entourage_contact   � ��� l �����  � 5 / function to delete the contact from Entourage.   � ���� O ��� I  
������� 40 delete_entourage_contact delete_Entourage_contact� ���� o  ���� *0 original_contact_id original_contact_ID��  ��  �  f  ��  ��  ��  ��  �� 0 i  � m   � ����� � o   � ����� 0 num_contacts  ��  � ��� l ������  ��  � ��� l �����  � < 6 The work is done and all of the data has been updated   � ��� l �����  � : 4 in Entourage. Close the workbook without saving it.   � ��� I &����
�� .coreclosnull���    obj � o  ���� 0 entourage_workbook  � �����
�� 
savo� m  "��
�� savono  ��  � ���� l ''������  ��  ��  � m     u� ��� l **������  ��  � ��� l **�����  � E ? Call the delete_tempfile routine to delete any temporary files   � ��� l **�����  �   that were created.   � ��� I  */�������� 0 delete_tempfile  ��  ��  � ���� l 00������  ��  ��  � ��� l     ������  ��  � ��� l      �����  �60 
	-------------------------------------------------------------------------------
		Function:		delete_tempfile
		
		Description:		This routine deletes any of the
						temporary files that are used by this script.
					
		-------------------------------------------------------------------------------
	   � ��� i   � ���� I      �������� 0 delete_tempfile  ��  ��  � k     G��    l     ������  ��    l     ����   2 , Get the path to the temporary items folder.     r     	 I    ��	

�� .earsffdralis        afdr	 m     ��
�� afdrtemp
 ����
�� 
rtyp m    ��
�� 
TEXT��   o      ���� 0 temporary_folder    l  
 
������  ��    l  
 
����   7 1 Create the path name for the temporary workbook.     r   
  b   
  o   
 ���� 0 temporary_folder   m      Entourage Contacts    o      ���� 0 temp_filename    l   ������  ��    l   ����   < 6 Create the path name for the temporary script object.     r      b    !"! o    ���� 0 temporary_folder  " m    ##  ContactsScriptObject     o      ���� 0 temp_script_obj   $%$ l   ������  ��  % &'& Q    8()*( O    /+,+ k    .-- ./. l   ��0��  0 - ' Tell the finder to delete these files.   / 121 I   %��3��
�� .coredelonull���    obj 3 4    !��4
�� 
file4 o     ���� 0 temp_filename  ��  2 5��5 I  & .��6��
�� .coredelonull���    obj 6 4   & *��7
�� 
file7 o   ( )���� 0 temp_script_obj  ��  ��  , m    88�null     ߀��  
$
Finder.app						temporary files that are used by this script.
	MACS   alis    `  Perrin                     ��H+    
$
Finder.app                                                       2����        ����  	                CoreServices    ��#      ���      
$  
  
  -Perrin:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    P e r r i n  &System/Library/CoreServices/Finder.app  / ��  ) R      ��9:
�� .ascrerr ****      � ****9 o      ���� 0 errmsg errMsg: ��;<
�� 
errn; o      ���� 0 errnum errNum< ��=>
�� 
erob= o      ���� 0 errfrom errFrom> ��?@
�� 
ptlr? o      ���� 0 	errresult 	errResult@ ��A��
�� 
errtA o      ���� 0 errto errTo��  * l  7 7��B��  B &   If an error occurs, do nothing.   ' CDC l  9 9������  ��  D EFE l  9 9��G��  G Q K If any files were moved to the trash, make sure that the trash is emptied    F HIH l  9 9��J��  J 2 , . The more safety-minded person may want to   I KLK l  9 9��M��  M ) # comment out this part of the code.   L NON O   9 EPQP I  = D��R��
�� .fndremptnull��� ��� obj R l  = @S��S 1   = @��
�� 
trsh��  ��  Q m   9 :8O T��T l  F F������  ��  ��  � UVU l     ������  ��  V W��W l     ������  ��  ��    XYX l     ��~�  �~  Y Z[Z l     �}\�}  \ + % Determine how the script was called.   [ ]^] l     �|�{�|  �{  ^ _`_ l      �za�z  aXR 
	-------------------------------------------------------------------------------
		Function:		main
		
		Description:		This is the entry point for this script.
							It checks whether the Entourage Contacts workbook exists
							in Excel. If the workbook exists, then it tries to upload the
							data from Excel back into Entourage.  If the workbook does not
							exist (the normal case), it creates the workbook
							and puts all of the contact data into a list object 
							in that workbook.
					
		-------------------------------------------------------------------------------
	   ` bcb l     �y�x�y  �x  c ded l     �wf�w  f I C The local variable get_contacts is used to see whether this script   e ghg l     �vi�v  i M G should create the Entourage Contacts workbook or process the contacts.   h jkj l    l�ul r     mnm m     �t
�t boovtruen o      �s�s 0 get_contacts  �u  k opo l     �r�q�r  �q  p qrq l    s�ps O     tut k    vv wxw l   �o�n�o  �n  x yzy l   �m{�m  { J D Check to see whether Excel has a workbook named Entourage Contacts.   z |}| r    ~~ l   ��l� 5    �k��j
�k 
X141� m   
 ��  Entourage Contacts   
�j kfrmname�l   o      �i�i 0 entourage_workbook  } ��h� Z    ���g�f� I   �e��d
�e .coredoexbool       obj � o    �c�c 0 entourage_workbook  �d  � k    �� ��� l   �b��b  � > 8 If the workbook was found, then the contacts need to be   � ��� l   �a��a  � F @ processed. This is marked by setting the get_contacts variable.   � ��� l   �`��`  �  
 to false.   � ��_� r    ��� m    �^
�^ boovfals� o      �]�] 0 get_contacts  �_  �g  �f  �h  u m    u�p  r ��� l     �\�[�\  �[  � ��� l     �Z��Z  � C = If get_contacts is false, then upload contacts in Excel back   � ��� l     �Y��Y  � G A into Entourage by telling the Excel_Erage_Contacts script object   � ��� l     �X��X  � ) # to update_from_Excel_to_Entourage.   � ��� l  ! ;��W� Z   ! ;���V�U� H   ! #�� o   ! "�T�T 0 get_contacts  � k   & 7�� ��� O  & 4��� I   . 3�S�R�Q�S @0 update_from_excel_to_entourage update_from_Excel_to_Entourage�R  �Q  � o   & +�P�P ,0 excel_erage_contacts Excel_Erage_Contacts� ��O� L   5 7�N�N  �O  �V  �U  �W  � ��� l     �M�L�M  �L  � ��� l     �K��K  � 4 . At this point, the contacts in Entourage must   � ��� l     �J��J  � : 4 be acquired and placed into a list object in Excel.   � ��� l  < P��I� O   < P��� k   D O�� ��� l  D D�H�G�H  �G  � ��� l  D D�F��F  � 7 1 Ensure that all of the temporary files are gone.   � ��� I   D I�E�D�C�E 0 delete_tempfile  �D  �C  � ��� l  J J�B�A�B  �A  � ��� l  J J�@��@  � - ' Get the Entourage contacts into Excel.   � ��?� I   J O�>�=�<�> F0 !get_entourage_contacts_into_excel !Get_Entourage_Contacts_Into_Excel�=  �<  �?  � o   < A�;�; ,0 excel_erage_contacts Excel_Erage_Contacts�I  � ��� l     �:�9�:  �9  � ��� l     �8�7�8  �7  � ��6� l     �5�4�5  �4  �6       �3����2��3  � �1�0�/�.�1 ,0 excel_erage_contacts Excel_Erage_Contacts
�0 .aevtoappnull  �   � ****�/ 0 get_contacts  �. 0 entourage_workbook  � �-   ��- ,0 excel_erage_contacts Excel_Erage_Contacts� �����,�+�������� �*����*  � �)�(�) ,0 excel_erage_contacts Excel_Erage_Contacts
�( .aevtoappnull  �   � ****� �'��&�%���$
�' .aevtoappnull  �   � ****� k     P�� j�� q�� ��� ��#�#  �&  �%  �  � 
�"u�!�� ������" 0 get_contacts  
�! 
X141
�  kfrmname� 0 entourage_workbook  
� .coredoexbool       obj � @0 update_from_excel_to_entourage update_from_Excel_to_Entourage� 0 delete_tempfile  � F0 !get_entourage_contacts_into_excel !Get_Entourage_Contacts_Into_Excel�$ QeE�O� *���0E�O�j  fE�Y hUO� b    *j+ UOhY hOb    *j+ O*j+ 	U� ������������ 0 contact_item_display_list  � &0 excel_column_data Excel_Column_Data� 0 button_height_in_rows  � 0 data_offset_from_button  � ,0 imported_contact_ids imported_contact_IDs� F0 !get_entourage_contacts_into_excel !Get_Entourage_Contacts_Into_Excel� 40 delete_entourage_contact delete_Entourage_contact� 0 create_new_contact  � 60 process_entourage_contact process_Entourage_Contact� @0 update_from_excel_to_entourage update_from_Excel_to_Entourage� 0 delete_tempfile  � ��� �   ' * - 0 3 6 : = @ C F I M P S V Y [� ��� �   j m p s v y |  � � � � � � � � � � � � � � � � � ��, �+ � ���  �  � � ��
�	���� F0 !get_entourage_contacts_into_excel !Get_Entourage_Contacts_Into_Excel�
  �	  � &�������� ������������������������������������������������������������� 0 id_list ID_List� 0 erage_contacts  � 0 cnt_contacts  � 0 i  � 0 cur_contact  � 0 contact_item_list  � 0 contact_data_item  �  0 errmsg errMsg�� 0 errnum errNum�� 0 errfrom errFrom�� 0 	errresult 	errResult�� 0 errto errTo�� 0 
addres_obj  �� 0 cnt_eaddress cnt_EAddress�� 0 found_address  �� 0 cur_eaddress cur_EAddress�� 0 temporary_folder  �� 0 temp_filename  �� 0 contact_window  �� 0 list_offset  �� 0 cnt_headings  �� 0 cell_reference  �� 0 cur_contant_data  �� 0 j  �� 0 contact_sheet Contact_Sheet�� 0 id_sheet ID_Sheet�� 0 cnt_id cnt_ID�� 0 range_referece  �� 0 myrange myRange�� 0 mylist myList�� 0 script_file  �� 0 	do_button  �� ,0 update_button_script Update_button_script�� 0 
row_height  �� 0 entourage_workbook  �� 0 contacts_list  �� 0 num_contacts  �� 0 update_button  � �����������w������������6��]��������������������q�����"Ip�����������������u�����������������������������������������������������%&����������i��������������������� "$&(*C��R`]r�������������������������
�� 
cAbE
�� .corecnte****       ****
�� 
pFrN�� 0 errmsg errMsg� �����
�� 
errn�� 0 errnum errNum� �����
�� 
erob�� 0 errfrom errFrom� �����
�� 
ptlr�� 0 	errresult 	errResult� ������
�� 
errt�� 0 errto errTo��  
�� 
pLsN
�� 
hmAd
�� 
PAST
�� 
PACY
�� 
PASE
�� 
PAZP
�� 
PACT�� 
�� 
hmNm
�� 
mbNm
�� 
cEmA
�� 
qpro
�� 
clbl
�� ePATeHme
�� 
pcnt
�� 
bsAd
�� 
bsNm
�� ePATeWrk
�� 
ID  
�� afdrtemp
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� .miscactvnull��� ��� null
�� 
kocl
�� 
X141
�� .corecrel****      � null
�� 
1172
�� 
kfil
�� .coresavenull���    obj 
�� 
cwin
�� kfrmname
�� e239 
�� 
1149
�� 
1107
�� 
1760
�� 
cobj
�� 
utxt
�� 
ccel
�� 
1562
�� 
pnam
�� 
X128
�� 
XwSH
�� 
insh
�� 
prdt�� 
�� .coreslctnull��� ��� obj 
�� 
X117
�� 
X244
�� 
2180
�� .sTBL1524null���   7 X117�� 
�� 
ccol
�� 
1536
�� 
fpth
�� 
savo
�� savoyes �� 
�� .sysostornull��� ��� scpt��  ��  
�� 
ret 
�� 
1611
�� 
X246
�� 
Xbtn
�� 
ptop
�� 
plft
�� 
hght
�� 
pwid�� �
�� 
1108�� 

�� 
BCOa
�� 
enbl�@jvE�OjvE�OjE�O�X*�-j E�OKk�kh *�/E�OjvE�O ��,E�O��%E�W X  ��%E�O ��,E�O��%E�W X  ��%E�O��,E�O�j j � ��,E�O��%E�W X  ��%E�O ��,E�O��%E�W X  ��%E�O ��,E�O��%E�W X  ��%E�O �a ,E�O��%E�W X  �a %E�O �a ,E�O��%E�W X  �a %E�OPY  ka kh �a %E�[OY��O �a ,E�O��%E�W X  ��%E�O �a ,E�O��%E�W X  ��%E�O g�a -j E�OfE�O >k�kh �a �/a ,E�O�a ,a   �a ,E�O��%E�OeE�OY h[OY��O� �a %E�Y hOPW X  �a %E�O�a ,E�O�j j � ��,E�O��%E�W X  �a  %E�O ��,E�O��%E�W X  �a !%E�O ��,E�O��%E�W X  �a "%E�O �a ,E�O��%E�W X  �a #%E�O �a ,E�O��%E�W X  �a $%E�OPY  ka kh �a %%E�[OY��O �a &,E�O��%E�W X  �a '%E�O e�a -j E�OfE�O >k�kh �a �/a ,E�O�a ,a (  �a ,E�O��%E�OeE�OY h[OY��O� 
��%E�Y hOPW X  ��%E�O �a ),E�O��%E�O��%E�W X  �a *%E�O��kv%E�[OY��UOa +a ,a -l .E^ Oa /B*j 0O*a 1a 2l 3O] a 4%E^ O*a 5,a 6] l 7O*a 8a 9a :0E^ Oa ;] a <,FOf*a =,a >,FOb  b  E^ Ob   j E^ O >k] kh b  a ?�/] %a @&E^ Ob   a ?�/*a A] /a B,F[OY��O�j E�O \k�kh �a ?�/E^ O Bk] kh b  a ?] /�] %a @&E^ O] a ?] /*a A] /a B,F[OY��[OY��O*a =,E^ Oa C] a D,FO*a 5,a Ea Fa :0E^ O*a 1a Ga H*a 5,6a Ia Da Jla K 3E^ O] j 0O�j E^ O %k] kh �a ?�/*a Aa L�%/a B,F[OY��O] j MOa N] %a O%b  a ?] /%�] %a @&E^ O*a P] /E^ O*a 1a Qa H*a =,a Ia R] la K 3E^ O] j SOb  a ?a T/a U%b  a ?a T/%a @&E^ Oj*a V] /a W,FUO] a X%a @&E^ OeE^ O b   a Y] a Za [a \ ]W X ^ _fE^ O] 8a `_ a%a b%_ a%a c%_ a%a d%_ a%a e%_ a%a f%_ a%a g%_ a%a h%_ a%a i%_ a%a j%_ a%a k%_ a%E^  Oa / �*a Pa l/a m,E^ !O*a 2a na :0E^ "O] "j 0O*a 2a oa :0a Ea pa :0j MO*a Ea qa :0a Qk/E^ #O] #a r-j E^ $O*a 1a sa H*a 2a ta :0a Ea ua :0a Ia vja wja x] !b   a ya za {a |a }a K 3E^ %O]  ] %a ~,FOe] %a ,FOPUY h� ������������� 40 delete_entourage_contact delete_Entourage_contact�� ����� �  ���� 0 
contact_id 
contact_ID��  � ������������~�}�|�{�z�� 0 
contact_id 
contact_ID�� 0 temp_number  �� 0 	temp_list  �� 0 contact_to_delete  �� 0 errmsg errMsg� 0 errnum errNum�~ 0 errfrom errFrom�} 0 	errresult 	errResult�| 0 errto errTo�{ 0 contact_list  �z 0 
error_name  � ��y�x��w�v�u�t�		�s
�y 
long
�x 
cAbE�  
�w 
ID  
�v 
cobj
�u .coredelonull���    obj �t 0 errmsg errMsg� �r�q�
�r 
errn�q 0 errnum errNum� �p�o�
�p 
erob�o 0 errfrom errFrom� �n�m�
�n 
ptlr�m 0 	errresult 	errResult� �l�k�j
�l 
errt�k 0 errto errTo�j  
�s .sysodlogaskr        TEXT�� J� F��&E�O*�-�[�,\Z�81E�O��k/E�O 
�j W X  ��k/%�%��l/%E�O�j OhU� �i	�h�g���f�i 0 create_new_contact  �h �e��e �  �d�d 0 contact_list  �g  � �c�b�a�`�_�^�]�\�[�Z�Y�X�c 0 contact_list  �b 0 new_contact  �a 0 errmsg errMsg�` 0 errnum errNum�_ 0 errfrom errFrom�^ 0 	errresult 	errResult�] 0 errto errTo�\ 0 
error_name  �[ 0 home_address  �Z 0 business_address  �Y 0 
home_email  �X 0 
work_email  � 1��W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�	t	y�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8
C�7�6�5�4�3
{
�
��2�1
�
�
�W 
kocl
�V 
cAbE
�U 
prdt
�T 
pFrN
�S 
cobj
�R 
pLsN
�Q 
hmNm�P 
�O 
mbNm�N 	
�M 
bsNm�L �K 
�J 
�I .corecrel****      � null�H 0 errmsg errMsg� �0�/�
�0 
errn�/ 0 errnum errNum� �.�-�
�. 
erob�- 0 errfrom errFrom� �,�+�
�, 
ptlr�+ 0 	errresult 	errResult� �*�)�(
�* 
errt�) 0 errto errTo�(  
�G .sysodlogaskr        TEXT
�F 
hmAd
�E 
PAST
�D 
PACY�C 
�B 
PASE�A 
�@ 
PAZP�? 
�> 
PACT
�= 
bsAd�< �; �: �9 �8 
�7 
cEmA
�6 
insh
�5 
pcnt
�4 
clbl
�3 ePATeHme�2 
�1 ePATeWrk�f��� **�����k/��l/���/���/���/�� E�W #X  a ��k/%a %��l/%E�O�j OhO�a ,E�O��m/�a ,FO���/�a ,FO��a /�a ,FO��a /�a ,FO��a /�a ,FO��a ,FO�a ,E�O��a /�a ,FO��a  /�a ,FO��a !/�a ,FO��a "/�a ,FO��a #/�a ,FO��a ,FOa $���/ K '*�a %a &�5�a '���/a (a )�a  E�W  X  a *��k/%a +%��l/%E�O�j Y hOa ,��a -/ M )*�a %a &�5�a '��a -/a (a .�a  E�W  X  a /��k/%a 0%��l/%E�O�j Y hU� �'
��&�%���$�' 60 process_entourage_contact process_Entourage_Contact�& �#��# �  �"�!�" 0 contact_list  �! 0 
contact_id 
contact_ID�%  � � �������������������  0 contact_list  � 0 
contact_id 
contact_ID� 0 temp_number  � 0 	temp_list  � 0 contact_to_process  � 0 errmsg errMsg� 0 errnum errNum� 0 errfrom errFrom� 0 	errresult 	errResult� 0 errto errTo� 0 
error_name  � 0 original_item  � 0 
excel_item 
Excel_item� 0 original_address  � 0 cnt_eaddress cnt_EAddress� 0 found_address  � 0 i  � 0 cur_eaddress cur_EAddress� 0 
home_email  � 3������
�	��TY�������� ��������������������������������������������������������������� 0 create_new_contact  
� 
long
� 
cAbE
�
 
ID  
�	 
cobj� 0 errmsg errMsg� �����
�� 
errn�� 0 errnum errNum� �����
�� 
erob�� 0 errfrom errFrom� ���� 
�� 
ptlr�� 0 	errresult 	errResult  ������
�� 
errt�� 0 errto errTo��  
� .sysodlogaskr        TEXT
� .coredoexbool       obj 
� 
pFrN
� 
pLsN
� 
hmAd
� 
PAST
� 
PACY�  
�� 
PASE�� 
�� 
PAZP�� 
�� 
PACT�� 
�� 
hmNm�� �� 	
�� 
mbNm
�� 
cEmA
�� .corecnte****       ****
�� 
qpro
�� 
clbl
�� ePATeHme
�� 
pcnt�� 

�� 
kocl
�� 
insh
�� 
prdt
�� .corecrel****      � null
�� 
bsAd�� �� �� �� �� 
�� 
bsNm�� 
�� ePATeWrk�� �$����  ) *�k+ UOhY hO  ��&E�O*�-�[�,\Z�81E�O��k/E�W X  	��k/%�%��l/%E�O�j OhO�j  *�k+ OhY hO��,E�O��k/E�O�� 
���,FY hO��,E�O��l/E�O�� 
���,FY hO�a ,E�O�a ,E�O��m/E�O�� ��a ,FY hO�a ,E�O��a /E�O�� ��a ,FY hO�a ,E�O��a /E�O�� ��a ,FY hO�a ,E�O��a /E�O�� ��a ,FY hO�a ,E�O��a /E�O�� ��a ,FY hO��a ,FO�a ,E�O��a /E�O�� ��a ,FY hO�a ,E�O��a /E�O�� ��a ,FY hO�a -j E�OfE�O ]k�kh �a ] /a  ,E^ O] a !,a "  1eE�O] a #,E�O��a $/E�O�� �] a #,FY hOY h[OY��O� = 1*a %a a &�5a 'a #��a $/a !a "a a  (E^ W X  	hY hO�a ),E�O�a ,E�O��a */E�O�� ��a ,FY hO�a ,E�O��a +/E�O�� ��a ,FY hO�a ,E�O��a ,/E�O�� ��a ,FY hO�a ,E�O��a -/E�O�� ��a ,FY hO�a ,E�O��a ./E�O�� ��a ,FY hO��a ),FO�a /,E�O��a 0/E�O�� ��a /,FY hO�a -j E�OfE�O ]k�kh �a ] /a  ,E^ O] a !,a 1  1eE�O] a #,E�O��a 2/E�O�� �] a #,FY hOY h[OY��O� = 1*a %a a &�5a 'a #��a 2/a !a 1a a  (E^ W X  	hY hOPU� ����������� @0 update_from_excel_to_entourage update_from_Excel_to_Entourage��  ��   �������������������������� 0 entourage_workbook  �� 0 contacts_list  �� 0 num_contacts  �� "0 contact_id_list contact_ID_list�� 0 list_offset  �� 0 i  �� 0 cur_contact_list  �� 0 j  �� 0 cell_reference  �� 0 
contact_id 
contact_ID�� 
0 urange  �� *0 original_contact_id original_contact_ID u�������������������������������X�����������������
�� 
X141
�� kfrmname
�� .miscactvnull��� ��� null
�� 
X128
�� .coreslctnull��� ��� obj 
�� 
X244
�� 
X246
�� .corecnte****       ****�� 
�� 
cobj
�� 
utxt
�� 
ccel
�� 
1562�� �� 60 process_entourage_contact process_Entourage_Contact
�� 
1756�� 40 delete_entourage_contact delete_Entourage_contact
�� 
savo
�� savono  
�� .coreclosnull���    obj �� 0 delete_tempfile  ��2�&*���0E�O�j O*���0j O*���0�k/E�O��-j E�OjvE�Ob  b  E�O |k�kh jvE�O +k�kh b  ��/��%�&E�O�*�/a ,%E�[OY��Ob  �a /��%�&E�O*�/a ,E�O�a  
��%E�Y hO) 	*��l+ U[OY��O*�a �0�a �0a ,E�O��-j E�O 9k�kh a �%�&E�O*�/a ,E�O�� ) *�k+ UY h[OY��O�a a l OPUO*j+ OP� ����������� 0 delete_tempfile  ��  ��   ������������������ 0 temporary_folder  �� 0 temp_filename  �� 0 temp_script_obj  �� 0 errmsg errMsg�� 0 errnum errNum�� 0 errfrom errFrom�� 0 	errresult 	errResult�� 0 errto errTo ��������#8����������
�� afdrtemp
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� 
file
�� .coredelonull���    obj �� 0 errmsg errMsg ����
�� 
errn�� 0 errnum errNum ����
�� 
erob�� 0 errfrom errFrom ����
�� 
ptlr�� 0 	errresult 	errResult ������
�� 
errt�� 0 errto errTo��  
�� 
trsh
�� .fndremptnull��� ��� obj �� H���l E�O��%E�O��%E�O � *�/j O*�/j UW X 	 
hO� 	*�,j UOP
�2 boovtrue� ��	��  	   ascr  ��ޭ