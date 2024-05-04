#include "HttpClient.h"

#include <QNetworkRequest>
#include <QUrl>
#include <QNetworkReply>

HttpClient::HttpClient(QObject *parent)
    : QObject{parent}, manager_{new QNetworkAccessManager}
{
  connect(manager_, &QNetworkAccessManager::finished, this, &HttpClient::finish);
}

void HttpClient::popularRadioStation()
{

  QNetworkRequest request{QUrl{"http://localhost:3000/dj/hot"}};

  QNetworkReply* reply = manager_->get(request);
}

void HttpClient::finish(QNetworkReply *reply)
{
  QByteArray data = reply->readAll();
  emit onFinish(data);
}
