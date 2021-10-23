# General Config
FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Update Environment
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN apt-get -y autoremove

# Install python
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip

# Install other apt packages
RUN apt-get -y install zip
RUN apt-get -y install git
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get -y install graphviz
RUN apt-get -y install ffmpeg
#RUN apt-get -y install libspatialindex-c4v5
RUN apt-get -y install curl
RUN apt-get -y install chromium-browser

RUN apt-get -y install wget
RUN wget https://chromedriver.storage.googleapis.com/94.0.4606.61/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN cp chromedriver bin/chromedriver

# Install chromedriver for Selenium
#RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
#RUN chmod +x /usr/local/bin/chromedriver

#RUN apt-get -y install chromium-chromedriver
#RUN apt-get -y install chromium-browser

# Update git settings
RUN git config --global core.filemode false

# Install general packages
#RUN pip3 install chromedriver_autoinstaller
RUN pip3 install jupyter pandas
RUN pip3 install selenium==3.141.0
RUN pip3 install numpy requests 
RUN pip3 install matplotlib==3.2.0
RUN pip3 install beautifulsoup4 
RUN pip3 install sklearn 
RUN pip3 install gitpython 
RUN pip3 install pylint 
RUN pip3 install graphviz 
RUN pip3 install bs4 
RUN pip3 install lxml 
RUN pip3 install Flask flask 
RUN pip3 install html5lib 
#RUN pip3 install geopandas shapely descartes 
RUN pip3 install click 
#RUN pip3 install netaddr
#RUN pip3 install pysal

# Install pytorch, see pytorch.org for updated command
#RUN pip3 install torch==1.4.0+cpu torchvision==0.5.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb


