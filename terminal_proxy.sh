# echo "source /c/User/Documents/AutoHotkey/terminal_proxy.sh" >> ~/.bashrc
# alias set-proxy='export https_proxy=127.0.0.1:7890 http_proxy=127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
# ��������
function proxy_on(){
   export ALL_PROXY=socks5://127.0.0.1:7789  # ע����Ķ˿ںſ��ܲ���1087��ע���޸�
   export http_proxy=http://127.0.0.1:7789
   export https_proxy=https://127.0.0.1:7789
   echo -e "�ѿ�������"
}

function proxy_off(){
   unset ALL_PROXY
   unset http_proxy
   unset https_proxy
   echo -e "�ѹرմ���"
}
