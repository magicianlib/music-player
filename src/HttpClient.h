#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>

class HttpClient : public QObject
{
    Q_OBJECT
public:
    explicit HttpClient(QObject *parent = nullptr);

    Q_INVOKABLE void popularRadioStation();

signals:
    void onFinish(QByteArray data);

protected slots:
  void finish(QNetworkReply* reply);

private:


    QNetworkAccessManager* manager_{};
};

#endif // HTTPCLIENT_H
