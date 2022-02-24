#!/bin/bash
#= setup_rpi.sh

SETUP_A="setup_a_before_net.sh"
SETUP_B="setup_b_after_net.sh"
SETUP_0="setup_0_add_wifi.sh"

#
MYUID=$( id -u )
if [ $MYUID != 0 ]; then
  echo "# provide your password for 'sudo':" ; sudo "$0" "$@" ; exit 1 ;
fi

#
cd /root/
#
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# NEXT: extracting <internal>.tgz.base64.txt ..."
#
rm -f setup_?_*.sh
#
# cat <<HERE > ${BASE}
cat <<HERE | openssl base64 -d | tar xvzf - 
H4sIALHyF2IAA+07fV/aytL9m08xJ3IL2BMCwbfSxl5UPPWK4hWs7aktv5AskBqS
NC+obb2f/ZnZvBA0or3Xnvb8HmJFsjM7OztvOzu79ZgfOL1KT9X13oUxMMre6Mlj
PxV81ldX6W91fbWS/ktf5bW19SfVFbmyur5elasrT7BpvVZ7ApVH5yTjCTxfdQGe
fNKHc/Hug/9Nn6XfpL5hSX3VG+WWFPBum0Mu12l2T456DUUIoWqvzwa2y3oW8xEu
RPCtGN7vqQOfuTfAlRg8Q1zI5ZZATP084z/iHT/fC/1bE3dU1/dg4NrjOriq5xii
ZlsDYwiKsgkj33e8uiQNDX8U9MuaPZaOjwxxx/B815bS6LklpPUy3bKZy223D3f3
/lCkvm37Utha9i/9XO6k0zxW8l87JzvtHn2vi/nixcgGcQzfQL04h8JXcFzD8iFf
hetC6TqXM7yeY0CxBF9zAI3j7ddKvqg750MQRY4pqq42Mnym+YHLSohjDOA9CHlC
FUABQXXHo4EAH+Dbt1uAtRUCvAB/xCzsCuCiEbkWVPCFmR5Lt1XxZWDkiKUBhFwl
HbcPdlp7h814xmPdNCzGpxxRSRAc19ZihBySC+dnWyyaIdIeuswB8TMIH4/ZxPAQ
eOYt1/G3UnlfEZ+r4qAh7n5Ifc0LENF1AsMa2HfNZx7t91CVax+y6ae+Ege1tXmD
f780SQD+hR0J4H/mcGUOc7lk/PyrZOwvzH20wd8/17bnSSeTgYEduP8LA7V7+bqP
jSHzkY+ef+Wk7DC2zJRCmYbOWo2NKdbcTQQ5rW/eUkm0jVG6F0aE3kSNZ20GKgYl
IV8V8EOmj5oAL18227uwSS/lvnou5ExbU004Z1eK6nnM9YuqO3xf/VCKABPVDFga
JCeggZVur03bDTPpYdhl22FWcWCVYvBY1VlPG6nWkCkDlSaECxOQ54Jh8c51evFw
Frodyoze62PV10ZF4ePSq394y0K5jCyXy4JSXs4LpamoCFWJQIjE2eeA9LC+yxuZ
peMnj3dF6lfKUQsFIsv20x1i8iHqDephL5RqbjxJxMqFTZrRTKa69+tmqhb5QWqZ
lb18v+y/T8b3SlhYQjiPtneJMRGIHAtEFmKneJg4Hl0GEdgOLP1Blpd4AK5rd4un
WF4uoYBCKRYJ+z8KWIaZElkoGwSV+GvIQWSEAH2XqeeRHOk3sj+OldAISVSmsg3D
nBWM+yyWoqZ6jJZ4Ixy1UPi2/P43DFcflkvJogEvXnDgtKkaNjFP1WL9jGzPt9Qx
S+j6IDFfk+J2TCt8F0QdBDjzz6wzN9Gs542moQ41MDE0BtgImLH7gYcd41hsWKrm
G5M74mB2mDMxU+pdmKrVQ2Ewd6BqXFk0HGlSN1xSpORdeZJmogVImM5Ky9KF4TKT
ed6LUK1RMkPs57EL5iopHlAdKEU+SQFTIsONvhJiSQjVZ+AfHUM4sYRpmjSbp/2d
09cfSBxT2oN3J3s7mGiCoYMYQCnH9ZDnzfCbgsY51QTXvIAJtWtPDJ3BFa7mmF17
3oXt6lzbBS/Q7UJdwNSIvqGOKhQ9/kkN7NLwybB5LrgEtHFBK8RhHe88F5P+cZMV
kjEOm2+7ddqh+YY1hFNj1wCy3wp0OjhnFR38qLMPRYpRHlyMDMdXDVPUDdW0h7/j
5NFq4WWTjH0TfJu8yPVLUMa4k8OooaNQiZAiCDnsbDIy6y8oBGrkds0NnqPQliAk
jzm+YTmB37cvQTjC9QmjBqMhIOwmV2CtArXNp1Wobj6VQd58Wku2APlXIGK8rMw4
zVI6J43GEyz0ECFOam7ylXRNMTX2hpwlLhpNtSgI9pG1seNflSFi1HevQB2qhlWO
GA2DA3fHpdxRo9M5en3c6DRn5xsbzu0pE8QZoQezMrSYOsGlwA+HBB6HccNxl0Ro
j9b0NNXBCOcwDXUGmC64GNaY63ETZRicdZ00j2HJZUN2iRMy7YtoJSKLVDDKhMYS
CecMJ/QNLUZHA39xdob/8GNYSLWLjIPKBCrHoPCJQMsEWs4EPSPQs0zQKwK9ygR9
JNDHTFCeQPlMkEQgKRP0nkDvM0EfCPQhC/QVIV8JALdA1wi6zgYVEVTMBpUQVMoG
CVzwZwJCMeznLhy1p5kGiAYqam+3sd0UgK9GuMKgYZ17kX5Ce7PgmYwvWuCDOABR
Tpa9IxDO/DzpHfcOMUI16ht6MLk17O1Erps1rsvG9oTFI1M7ms0mSDqbSFZgmmSe
1dAjcuSI6AkZVKigE5HACWZh0KZidhAeQoWz0FTPBIGPlFrThfa+kDtudtH5ivgH
o2L+FeZduWkAmDpoOgw8bHTMt3rj4diHw/ZhM3NogNuDR7nEw4bA5YHPb8rmXbPM
GooXHniQpEaRfZ4Jk1kcYKLRN+9V5ZwpPMwWkvLN3mG3edzY7u69aVKxposp6H3R
eBdfMejQ4sP8cNmy02FzJgzjv0xBY1yNkv7bzEVrZYjba+11usINZyDAXH8ISQcu
u8MNlpL1WOcBPXkV/pJkILckUsb+aPXfzJLuo1EPn/n1f1mu1lan9X8Z8aq12sr6
ov7/VzyZ9f8b5rA4AfhJxBcnAIsTgMUJwOIEYHECsDgBWJwALE4AFicAixOAv1H6
+gOJ/8QTgJ9Q89dGTDuHAD0AcBsaluwpp98EXuz3TNwdoHeLZGxrKyA/n7qU8kxK
qoNaVZRX6QjDbP8ZOK7G9vfeDr3LrcHBn1unb64+VTlRjBasDuIqhqnO64a8usbJ
6lNxqebQdnHTMeYchJyOrzymYQigsWKeeAedKImeavpQuHPcAmL4OgaaJciv5m+i
5U/X1ru6Vx0cv23Ju4f+wZvdjf39f709bG2/Y+zPWiV4677ZsOQ1e3cnEsvDmcoX
v1+EpRl27eq/O7tfaief3pmt45WNVv7fo+7w04Xz5iCwz7XLsfN5d39kdM7ttUD6
8vlQNY+OgtpptXF51W1wdofMYq7qU5UezTIWcwH1TdV+tW9PWKQJLvp67nWj81op
4ND9Zru51ndXB+9a/fU3TiN/VXZa3YMVb+J+Gjb/1d0IOrXa4arrr9lHB2vSuzfd
08k7q6yv7epbBRwbPea3yH3Irm65C7e4AoIKGKGYxxcSdAbP/x1Qrio/hyJbBI6J
m3raJIoO5L8Si9dEFGHYnpgu+RY2LdE6QHhhZWD7GnA1GDMp7KCNxrYO66ur01Zp
isoR7AuL6NWJZiZSFPTvmkk0i8DRw1k4aBPhTMIeRDuaBdf9KLYbBhQF7iwB/pTw
UMRNdXwsSBPhqxcbqAHaN03cq4Nj/A4u7nv5JMPejjGdIX9uTDPEok4zeJlYv4ok
uD5ZGMF5lKQqRvO4owg846B2FIeQ40dfBiY1noTpF7ZiViotwVOpAGHlA/tcz2Dt
hPJEy9EN33aVzA6U2rx8+bp53ITNzTTgZm8p8Fxed5sY4xxnABqtllLEjxIctunI
4HSnjm85IvaLCTltbpi19m0VF4Wx6lBdv+Bo1QrGc5L9fvPdViT4yBqlGJ2Wr5vC
IvRrqkFm9sA4SQjtxvEOhKWrk+NGd699CLt7rSZCt23LI4PHEJZwVcRQPVatQKW4
P2Tl3Nv9rYP2TrOlCJxPgRpajXftk64iBB5/fdM43mscdukYHN/aRzRGh962Gtv7
naPGdlMRhgHmf0JUiucaomqXmD48EPmBL08sw8w0YUqMkTDy2NYc3f68uwV8q8K4
PpnVO+mUT7q74kYhnXgkWXyIW8ZFDEMDC/PxCRQ+LuECA6newD+xd6u93Wg1I8OY
9hZmDALtIcTDSH6LBpd46OpixKooWrbI0yQPWo3DP+aABYIrKarCQ7QXEvJ+SXWd
0pUUDTd4dKGBlGaZM7pKHXSFF0bC7RPC+vzawGClLrP6+qC+/rz+nNXVFYQMXPZZ
kVfWZPzOkVpbchX+UD0fG/C1gn9wlWYK0SI7pmq14V4YHutphjNirrK9fXBE6Y1r
B86Ntvj4VTk9asjiUWefslLkkogxZbt9cNRqdps7NJRDhwV0d0WpVspytbyxUUbP
peFkp6cz2hImGH21Lq/XWb8uaziLut5HtAS2cRsWBDiT/sZgbaOm18T1DVUXVyu1
DbG/olXEfm21WtNXK9VKRUNBTo8U6RQ8a++IGzqOlLqGMXsOOaITSBH3yCWB7rlE
aWqIBLymz9WDg223Tw67x+8UwTIjVL5GZJ1Y4j450T2RsEzsf8cJdYIo5KMR7jit
n3fGSkXFC7qBwilOKSF0ipqkko3Ofq/b7h03t9rtrlKl5AkJjFTcxLuDc4MTzegW
wQKrj453zi9dpQqe6fo1JTtUbOE7a9qvT1RXMo0+7dt9NtalkJS0XCfhQrJrj8sB
FGvi/hzA9+LxCfSclTd0O/KNn+j6Hqa+Sa7Hr4TxU/XI+R96YyO8ZJV4uJC++yQM
scWwzL5cfdSrHY99ieK/vxLx3R7w3RcHvlcTXcxhXquYZUAX1T6rDtvSWODYFkbd
MVto5L/WyDzPxj2ToZo/wa25eLhfcw5CP549jolFGKguFaXyYTJ8E0n37QlzTfUK
dMMjfLHvT3F5ZNR8MwbCSDOI3lyhjPSx8TNFQuPDyPYdMxhmCoYQergcYEIQo03l
8yvmbeTBX5AfnrM1A9d2mNQYo25cXR1nZ9tJF7oveqMH4rrjVFJOuNHIN1G5z6Xp
PSQF9r9gSq3+KpJklz7msczx6qnWahnCmynAGccwUwc3sMDTXMPxYfoUMZtSPV4S
KW1SQ1w6alzjy8uXiqLADl0NPGyfpujLZQwrdH8AitElNspMxCitKqUwa+Xwzi8w
zFRCRjxmMi3qEQXA+hxOKsTJlOBKGXv6o/smNofg1izBH6mlx76ltnh+1JN1Yeux
x5h//68i11bXpvf/ajLd/5OrlcX9v7/iybz/N2sOP/z63/+nozwVo3VUpX7KXwwL
DdCMUr00dBYsXoHp2bhz9m0HJsYYtMA1YYiz8ZmJguYHXBPHAtz6hlURMcwhHdv1
RQdzQYJ88mxr9mWsXvXZpZc0mheOyA9zhszyRZ2hHseGxfQQAb8amj0Gy3c4r07g
DhnxFm6yMSlBtjEJEd3BdCOOiBLVSzxp+RerZCe5ZafzGnSVjW0ryiy9kXjOrqio
KTZwTnE50dXKOr+AECbhBDGsiX2egvD/VvWrJEl8lpEJ0TzDs07uhhDOVNNBolRB
Is2ROWkmpZcZl0sxAK5XLVPiNK5CImXqgR3LM61SCMPIwf0vOl0UaKjkqO5HDCfM
M69FQrJ4Fs/iWTyLZ/EsnsXDn/8D/As+6ABQAAA=
HERE

echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "
echo "# Next steps: "
echo "# 1. before internet: run script           (do as root)>    ${SETUP_A}   "
echo "# 2. reboot (to set wifi-country) "
echo "# 3. if no ethernet: select wifi-network:  (do as root)>    ${SETUP_0}   "
echo "# 4. with internet: run script             (do as root)>    ${SETUP_B}   "
echo "# - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - - - - - - - + + + - - - - - - "

#-EOF
