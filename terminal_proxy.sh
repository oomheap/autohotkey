# echo "source /c/Users/kratzer/Documents/AutoHotkey/terminal_proxy.sh" >> ~/.bashrc
# ��������
function proxy_on(){
   export ALL_PROXY=socks5://127.0.0.1:7890  # ע����Ķ˿ںſ��ܲ���1087��ע���޸�
   export http_proxy=http://127.0.0.1:7890
   export https_proxy=https://127.0.0.1:7890
   echo -e "�ѿ�������"
}

function proxy_off(){
   unset ALL_PROXY
   unset http_proxy
   unset https_proxy
   echo -e "�ѹرմ���"
}
