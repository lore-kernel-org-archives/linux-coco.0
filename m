Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2129.outbound.protection.outlook.com [40.107.100.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5C134A4
	for <linux-coco@lists.linux.dev>; Tue,  6 Feb 2024 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707241348; cv=fail; b=HyGINrDzQV8t886iXmE8Xrqr6M502Ap6FLbdkv+H1+T7SJbhatzb/auhAciRNqYfjcMVvl3QrfHvJ2T9zgFfowfYDRSoASuQXQ3jXATvCQTwtSENNIieHxMigX+IgbcRmlHSrjL1v2cVVe2/GWFSKTM0XamsxAI6hrvFL6g4WeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707241348; c=relaxed/simple;
	bh=OBi+040wwqULO8THNo6tIYtic/kL/T5xhNIIMwv5TxA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMDd0hGbNlY2W1xDGmGOj3SPBZAAD77I06nU/3e40c/ZDLfjbzMYjD9QJVDnScHSlJxQnw0zE+YlfzLTGUKQCdDpIFMNH7yzWde/7uTfRDY7rzCJPnM3Ln6bZqpLlvM4PkBO3+rCIk7c7upNtHK8K+QBnCc5qp2FtrOoqlrPEW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=Wfs8Bu4+; arc=fail smtp.client-ip=40.107.100.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="Wfs8Bu4+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzuS6EJelCzAitDOB09aChBLn7swWs8kNPkiwbcPsXeQ+O68vxPg3XPDejeUeCK2rJNDIOMeEIKfC5JBp5JSHyzfxn2xGDlQfWi9vb34k3WR8QDcy/G1H4v7E6M8c+uJPyBhspgQ5K9D5cB3m/CevIBFdSUP84oVUbjydSPAq5NCZh3T8ZhhTPkGmRe2KvoFS84VX+ASwboobjuK7UduLDNRAeZY8sh3eV8IlbGMxruJ/tMQdVlz7feLaEi7lCsRtrsojy9BxIp2qckxHlCsyTrDHUSR0gJu7sAcxSluEliXCLXb52Xs1O8yrR0LTXaY9knl6FEtXfPRqYl2oolWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReyKi+mYR5cbQYvN2pqaWFVoHbHGwRJp242c9IauhrQ=;
 b=QT8gCKU3ehF+rPQ6xw/OKUqn2uoGBIjVjIGZVy1ahALjkbOB0rIE1iZd04ZPg0R33+5n9vqPeHThNoZuVs9Bsg61qoxnNg7kjf4b/+yjhbhZeeD/eJSl1+bs1D+B9F4ZZrjhVRkwfPVQxXB6tAEslRH+xmX44cQ0ZlpKXLqOY3ciODuXd7e1Uow77lTwWvq8gBZjF5J8PIADi9Q5ehnwYx6dxYX005FVyJHfQ1q8O9cT9y8k6SpHE121p3zmtgcNTVlvUZx6AIUxKQZlANk0gmqseolnaHAByNXG+EUwPNjR6YNmuHiGYEqIV+RCRA4hb1wecBqLll54WceLDdVhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReyKi+mYR5cbQYvN2pqaWFVoHbHGwRJp242c9IauhrQ=;
 b=Wfs8Bu4+T1c9tQa891c3+21+pjpETGWcHiACWumNipDRogRSkgR4skxxjEYp787WEH+imsIROqQRSn9fsP3NeLcktR0Xw7q/54J87wCA+cz4RQSeZsu2x/+ZsTpZZF/6RQeM6V1xzwsolI87CHZONnwOZDjglZ6YBNl5N37h3IY=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by DS7PR21MB3453.namprd21.prod.outlook.com (2603:10b6:8:92::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.4; Tue, 6 Feb 2024 17:41:07 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::4707:3962:7bfc:bed5]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::4707:3962:7bfc:bed5%4]) with mapi id 15.20.7292.001; Tue, 6 Feb 2024
 17:41:07 +0000
From: Jon Lange <jlange@microsoft.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and
 Cargo workspace transition)
Thread-Topic: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024
 (and Cargo workspace transition)
Thread-Index: AQHaWRmjA5k8U0iEzkaE00F2cfxdIrD9lIbw
Date: Tue, 6 Feb 2024 17:41:07 +0000
Message-ID:
 <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
In-Reply-To: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4438e998-0ad0-4635-b975-28d053b01c50;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2024-02-06T17:38:57Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|DS7PR21MB3453:EE_
x-ms-office365-filtering-correlation-id: 4d945d14-871c-4687-e8d6-08dc273acc7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cBp0UReSW5rY+ne6ulFZIfJUTWyjhJF7NVRBddTUQPR/J/pODl+weWXG1Mp7D53tkmfXpmxNs6U7e6JLRUOfNkJpxg8Y0mJi7Qvr7DdyS+Mc7bHjfu8B49N9mfAPmIXTSrk7JicPVW40qzU7iCUUpM8F/sYPJVCN5sQUDAglk11btxh43/JSiJ3udxLFzjYbZcUimIGD+c3MqxykJ6SH/v5voLo+PYwKDhiE3s5h/X+O/TKrDL/6fuvS41svMNDrl8OBK4YdKLzImlYjVtoe8fsstU6ULx8TgkDQaOdZWLf8gIbWKClcmFoOS7lbGfEW12kWF+QsrkZ7hZNOGKwQykZrs9zXtIYxdBxJTbnnRJ9HmmRHbVtlWAMu4zFaig4h7qxg4rTlCHIL5PhDkn16mYZ6PbgSb50ll33QkpnKGo7tACwSZe8FvoFOmWpWUzaX5NIC2m1HocCF9JAUGOnEc6zQSUOq2n7esROq9aZTu6GOe45J7b8FMzGeIifx0VJLpxJjb+H80SftYH2D5SlrD/vVGjqNnhpMV8KNPVuFuGfNvAgdzs4wYS1wLoOBMdT+Z6w9X6C/H1rjlbA/H4hwWjPMFLq9TwQ8Kd6uKTufh9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(83380400001)(6506007)(71200400001)(966005)(316002)(33656002)(10290500003)(478600001)(7696005)(110136005)(66446008)(64756008)(38070700009)(8936002)(52536014)(82960400001)(8676002)(38100700002)(76116006)(66556008)(66476007)(66946007)(53546011)(82950400001)(122000001)(66574015)(9686003)(86362001)(41300700001)(8990500004)(2906002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tqG0L1648OAHVmxuCd+TKExffVu2GyXN32xG0FULfCnieVUnfVSpb0rp1h?=
 =?iso-8859-1?Q?F7mauTGu8Zi3Tu22ziL5FM4dcC63zovrgsas1dnYD9ioksk41ZfNTtIHOM?=
 =?iso-8859-1?Q?4rASOPWU2utBS3n9tNU9uDmv8gtFAyLKWWlxUVGp21MiCOHDRWqz5RNTRt?=
 =?iso-8859-1?Q?sO9AST6UilbpZFAMfIgPAHW/yYxdz6okbmji0USbzPT74s+zL4odjreKng?=
 =?iso-8859-1?Q?+zy5xd7/JC7K62Fthwlxu1dBqyYVO1Gcs1bbOqbls/QQAHGaXNGNDSJqmj?=
 =?iso-8859-1?Q?WAwUgXpuNC6kThEMQEQVrGbNTTdMJjzYF7pvAoMIJViJBBDGkc5JPhptIq?=
 =?iso-8859-1?Q?uSIxD6prEM8FYJf+1+36gTsP673/ZF+Rph7hPnpewGV+uDkizgxz6jcILF?=
 =?iso-8859-1?Q?P/kJOHo9ji0y3VxLvNw708LcBjZNixvcYf/hFsAYW3dVUWOdRXBJRYBY68?=
 =?iso-8859-1?Q?hjK8DG9ZxyvgaroxzupI/HdICkCVY8qJz3m0g5QFBJick3n/eWm0aXD3FB?=
 =?iso-8859-1?Q?wHTLssAy/QxqXwn3VHP2Bo+tm7k0Jrl2likeiYA25jbOxvgTSnmUI/H0mL?=
 =?iso-8859-1?Q?hhlcKN4qZ+wdihyUdjtjnAgtGD+TGAtt0Ri/dZVrJ+VM8/aH+DcpQZMgc9?=
 =?iso-8859-1?Q?X19NzwVqfg5ziZDkm7D/gcbQL9C/3SX04In0LdLvgIlnLMqNTO+e9rczS6?=
 =?iso-8859-1?Q?BwwslaY2yKaI57igNtkoAxPCVsjAj311p6Ne+xJE9Lk3Jy6lCKa7ZKSMcu?=
 =?iso-8859-1?Q?vMa4P4Xsk0t2WirysLOL0907+KzhgzW2gsmEYvbI9Lrh0XpaDT2BZU0uwm?=
 =?iso-8859-1?Q?bPUISFK1CoHiJhYPkx7/vixRnDqYHWIyZN4Ci2xWWr4Jo8wDxQs3smIkuJ?=
 =?iso-8859-1?Q?pmZjZGbpu5VdP37Ffble4NPcj2KgJKaqZhobB7b1KJuM+L0Zg9aEuRP0s5?=
 =?iso-8859-1?Q?UM425cYuDca7x0G9KnOMmIlRFZ2YgCJbHSGHMZXhFn9R2UbrHA6ogj1Agd?=
 =?iso-8859-1?Q?RpJ7hjWOpoNN8lSGA8krYh9SSk8OV/Sh5NMM8zz5QXbQQCDETh+f9AxWSf?=
 =?iso-8859-1?Q?nSizXlSIFaF3M0o6xDYn1aa4K/HYZn6BwYzx2Uvx6jlYBAWpF/5j33l6jP?=
 =?iso-8859-1?Q?sztgFJi1MaYlwomIO3BgvRES2K0WF9a+ujXZ6X8XchxFQsVMVtX69TCLfb?=
 =?iso-8859-1?Q?69uYzJp08RYDl2F6VzwTAvpbzuGwko2FrJcZes8RlKfLKALj+7WvGt3Udk?=
 =?iso-8859-1?Q?v+tVSlzC9vbYhVzaFarQqngEInuYh+olamFtpXIx3MGgJSUhqFRfGVE1tF?=
 =?iso-8859-1?Q?O67b3F5mlZD14dZploEhTx8iZGkE6m0kOK8nRRYy9IVMInEGE6ADrL9H+l?=
 =?iso-8859-1?Q?TXYzHu0DzxRBxeRz9LnfSvKfqEU1QieGdkhcVs75Pa86gHwfix4yODZuGW?=
 =?iso-8859-1?Q?CwdvE91q+lw5pxqtw9Pg5CmytEgdB2aZxJ2z/as0/jWvRPbcmh9EoA6r9z?=
 =?iso-8859-1?Q?58Hw0XxAdx51v8z+JmiWrjvRoSGq2Wypf3P/lPxAmPlhXtI9uHKdeT6Yhc?=
 =?iso-8859-1?Q?3i9YNrBcSNMl0nogSB74mSJZvxrxJw80hQAwlD4cE3aLjgvIZKp7ixIXGz?=
 =?iso-8859-1?Q?+izeFgZDejZAgEsLDV/TR7Gjhn3GvVVgRPgfVgXg/dWqsFOx8RZCADvwdE?=
 =?iso-8859-1?Q?u3qwawt3oymSp1qeAoLwBre5tKEt4AwjrQDY0mFO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3072.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d945d14-871c-4687-e8d6-08dc273acc7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 17:41:07.2016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h089/4wm1DaCwlAT+5yn40DNuX9MY5IIXZdmJpKkt+bzAWHmozBjZaQm709cVv6mV+2jIKgkjc3fqJV+mZOrfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3453

Realistically, there will not be a point in time at which there are no pend=
ing PRs, so there will always be some number of PRs subject to conflict no =
matter when the transition is made.  It seems much better to make the trans=
ition as early as possible to reap the benefits of the transition.  Count m=
e as another voice in strong support of option (1).

-Jon

-----Original Message-----
From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of J=F6rg =
R=F6del
Sent: Tuesday, February 6, 2024 8:29 AM
To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
Subject: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and =
Cargo workspace transition)

Hi,

As some of you already noticed there is a PR now which transforms the SVSM =
repository into a cargo workspace.

I consider the move to a cargo workspace an important change which should b=
etter happen sooner than later, but it is also very intrusive, basically br=
eaking any other pending PR.

So there are two possible strategies right now:

1) Merge the cargo workspace PR and let everyone else rebase their work on-=
top. That is work for everyone, but should not cause major hickups as only =
file paths will change and not the actual file content
2) Merge some of the pending PRs first and then do the cargo workspace tran=
sition. This requires re-basing the cargo workspace PR, which is also quite=
 some work.

I am leaning towards option 1) as I think the sooner the transition is done=
 the better, but I am open to other opinions on this. So if you think optio=
n 1) will not work/causes too much hassle or we should do something differe=
nt, please speak up. Merging PRs is stopped until there is a decision on th=
is, which I hope will be made after the SVSM Development call tomorrow.

The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.

You are all invited to join the discussion at:

https://meet.google.com/ppv-xehx-dvb

Please also let me know of any additional agenda items you want to discuss,=
 either by replying to this email or raising them in the meeting.

A public Google calendar is available here:

https://calendar.google.com/calendar/u/0?cid=3DY181NWEzOGYzNDYwYzYzODc2MmE3=
NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhbGV=
uZGFyLmdvb2dsZS5jb20

Looking forward to see you all there and discuss the above topics!

Regards,

J=F6rg R=F6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=DFe 146
90461 N=FCrnberg
Germany
https://www.suse.com/

Gesch=E4ftsf=FChrer: Ivo Totev, Andrew McDonald, Werner Knoblich (HRB 36809=
, AG N=FCrnberg)

--
Svsm-devel mailing list
Svsm-devel@coconut-svsm.dev
https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
