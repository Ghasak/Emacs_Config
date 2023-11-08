# Productivity tip in Emacs
The work here is identical to our `nvim` productivity tip that we have created
at our `nvim` main config files `docs` sections.

## The following scnario is required.

### Comptue file size
Assume we want to pick specific files in our corresponding dired buffer shown below

1. Select and yank the buffer entriy from dired

drwxr-xr-x  3 gmbp staff   96 Jun 19 23:25 		Emacs_From_Scratch
drwxr-xr-x  5 gmbp staff  160 Jun 23 15:45 		assets
drwxr-xr-x  3 gmbp staff   96 Nov  7 01:16 		emacs_config_resources
drwxr-xr-x  4 gmbp staff  128 Nov  8 14:29 		emacs_debugging
drwxr-xr-x 16 gmbp staff  512 Nov  8 14:29 		emacs_fundamentals
drwxr-xr-x  5 gmbp staff  160 May 22 16:19 		emacs_keybinding
drwxr-xr-x  6 gmbp staff  192 Nov  8 14:10 		emacs_lsp
drwxr-xr-x  6 gmbp staff  192 Nov  8 14:28 		emacs_server_startup
drwxr-xr-x  4 gmbp staff  128 Nov  8 14:11 		emacs_setup
drwxr-xr-x  3 gmbp staff   96 Nov  8 14:17 		emacs_temp_file
drwxr-xr-x  6 gmbp staff  192 Nov  8 14:29 		emacs_tips_tricks
drwxr-xr-x 14 gmbp staff  448 Nov  3 22:20 		.
drwxr-xr-x 16 gmbp staff  512 Nov  7 01:18 		..
-rw-r--r--  1 gmbp staff 1976 Nov  3 22:20  README.md


2. Now put the cursor at the beginning to cut all the unnecessary info.

  96
 160
  96
 128
 512
 160
 192
 192
 128
  96
 192
 448
 512
1976

3. Now, add them together using

(+
  96
 160
  96
 128
 512
 160
 192
 192
 128
  96
 192
 448
 512
1976
)
4. Highlight them (visual mode) and apply the `emr-el-eval-and-replace` function
   form the `M:x` buffer.The results is shown that sum all the numbers.

4888

## How about adding table line

1. Adding simply the lines and repeat the action using (.)
| drwxr-xr-x |  3|  gmbp | staff|    96 | Jun | 19|  23:25 | 		Emacs_From_Scratch
| drwxr-xr-x |  5|  gmbp | staff|   160 | Jun | 23|  15:45 | 		assets
| drwxr-xr-x |  3|  gmbp | staff|    96 | Nov |  7|  01:16 | 		emacs_config_resources
| drwxr-xr-x |  4|  gmbp | staff|   128 | Nov |  8|  14:29 | 		emacs_debugging
| drwxr-xr-x | 16|  gmbp | staff|   512 | Nov |  8|  14:29 | 		emacs_fundamentals
| drwxr-xr-x |  5|  gmbp | staff|   160 | May | 22|  16:19 | 		emacs_keybinding
| drwxr-xr-x |  6|  gmbp | staff|   192 | Nov |  8|  14:10 | 		emacs_lsp
| drwxr-xr-x |  6|  gmbp | staff|   192 | Nov |  8|  14:28 | 		emacs_server_startup
| drwxr-xr-x |  4|  gmbp | staff|   128 | Nov |  8|  14:11 | 		emacs_setup
| drwxr-xr-x |  3|  gmbp | staff|    96 | Nov |  8|  14:17 | 		emacs_temp_file
| drwxr-xr-x |  6|  gmbp | staff|   192 | Nov |  8|  14:29 | 		emacs_tips_tricks
| drwxr-xr-x | 14|  gmbp | staff|   448 | Nov |  3|  22:20 | 		.
| drwxr-xr-x | 16|  gmbp | staff|   512 | Nov |  7|  01:18 | 		..
| -rw-r--r-- |  1|  gmbp | staff|  1976 | Nov |  3|  22:20 |  README.md

2. Now, you can also align using the `regex` supported by `emacs`.

| Permission | uid | user | group | size | month | day | time  | file name                     |
| drwxr-xr-x | 3   | gmbp | staff | 96   | Jun   | 19  | 23:25 | 		Emacs_From_Scratch     |
| drwxr-xr-x | 5   | gmbp | staff | 160  | Jun   | 23  | 15:45 | 		assets                 |
| drwxr-xr-x | 3   | gmbp | staff | 96   | Nov   | 7   | 01:16 | 		emacs_config_resources |
| drwxr-xr-x | 4   | gmbp | staff | 128  | Nov   | 8   | 14:29 | 		emacs_debugging        |
| drwxr-xr-x | 16  | gmbp | staff | 512  | Nov   | 8   | 14:29 | 		emacs_fundamentals     |
| drwxr-xr-x | 5   | gmbp | staff | 160  | May   | 22  | 16:19 | 		emacs_keybinding       |
| drwxr-xr-x | 6   | gmbp | staff | 192  | Nov   | 8   | 14:10 | 		emacs_lsp              |
| drwxr-xr-x | 6   | gmbp | staff | 192  | Nov   | 8   | 14:28 | 		emacs_server_startup   |
| drwxr-xr-x | 4   | gmbp | staff | 128  | Nov   | 8   | 14:11 | 		emacs_setup            |
| drwxr-xr-x | 3   | gmbp | staff | 96   | Nov   | 8   | 14:17 | 		emacs_temp_file        |
| drwxr-xr-x | 6   | gmbp | staff | 192  | Nov   | 8   | 14:29 | 		emacs_tips_tricks      |
