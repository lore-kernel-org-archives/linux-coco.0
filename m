Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AE3191CA
	for <linux-coco@lists.linux.dev>; Fri, 12 Dec 2025 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765553471; cv=fail; b=BB3wuOJ/3xASJq+aUBk2CgoD29HAyzXYeqxmgu5K3IFHe4K1YD1wrfmLBOcmLE3Dk2cxqK/9Ytpfk1tVPsRi38JU0aKKi4nRQXyILodwhaHlW9vxYOXKUUvG/7R+w35a0VBXiS6c9xqv5CaVR+tBPGybwpSX9qsWhU+XT3qdBmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765553471; c=relaxed/simple;
	bh=vAm7Nmbpsaq5fZ9YMnt8K+iRiEXnr3b2MMfUi0jlcYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sznimQyQTUId0P3977jFGix85z340CpbFsmyvSXMQIVsi1knJJD9T4KL7v1snBN9OXkIQac5i1VY8/OpoXYd+5AcTNx6kgfb1eoEbbAh4+UYmHK1tdsg8gVBt/bIE1ozoakE2AyKLqK1K7K26io9njH5ey21SFK0rgmVtwutr1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ARUDBgul; arc=fail smtp.client-ip=52.101.53.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ARUDBgul"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xskLFxs5WNtXZ+JDQ0X8EfK9ozUdj0dlaDMX1mV9yVHh9A9VcJjwPH4eKrCgDGOYDtMzGnLXZcCMIDipHdMbZXxs+vOgyTcDa9j2ckDY+/grKQxlX1u7PFvsGuK66kTK3MB6Wv5MpMoHjVyqMw4H+7fnuYvo4/ORZTUoqu9J0g+N9lRPfjGuQNeWKvlIbPBNs9I/SYBhB8v7CL/ts0q0PTXx+7BQ84NB8FcCrSzmAVCS+kzAoH+naV/ZPXTmODRJJ4+G7DHwHQ4fO7RMDfa+XECfWWKRPJvhazt3mpzAWowgxrYLiPRSzbWcH+zaMYgSha0dHdVCUkFbFkEFMn5j1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAm7Nmbpsaq5fZ9YMnt8K+iRiEXnr3b2MMfUi0jlcYw=;
 b=OU6aFjH5eniGxix1Yoq+wq87I87bquPgJZwJtOfNPajZHgRq7UDIk2HPF6wM331j/i8Wcn4rxsme+iVWLpt5DRXwT87f7VJKrDKX0G/mxWIEkuZj5d1XypBmau9LWGtVk30rkoWItZALTCdbQN8OIm/oonELv8M7JBt5HrPOU4a6UREblWBfbUANsS6xFO+B4H73JZPwb3UcnIsBeev7f1BJCnIZnSh5WnmBYF0CZ90J7S/R0/Y/piZnXrZ6s1pE+6GCJr8k1Z8H2eIy4wYO3O+cHJh0M/kHrYgIMcVUAk/YjPvwJDYCPPDSXTlRTpzNYHWiztbKExZwB3a9h4LxIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAm7Nmbpsaq5fZ9YMnt8K+iRiEXnr3b2MMfUi0jlcYw=;
 b=ARUDBgulfbWOKE+G1hV2xF/F/y07XF04GmFUIO+4mswzk6PqfZIF2QKsuAiOavW339hIY+5HpKlPocy1DV3RERPCTIsno3tnuU78tGtDHk3i7w8zjA5hS1W3Ix1gZvgZEUbyaLglqLMyoD2Zjjuw8yUt1wFc3cpQUFd5tHw26M5CVejSfu7zyv1BLkBxoZh8LwRtZ3322D3ro6EH5PVHP2OXxqQO6R4dLarv0qRaRWZupipICOHRcSgUNTyXIJMNoSg0MGMW6apsoyIkY9IVfl9MYOvLMX5WWaTLLwLNodHjb31sS7NGMNaDiXFxgfhFNbnP22VfTnyZFKqWl1gX9w==
Received: from MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:31:02 +0000
Received: from MW6PR12MB8897.namprd12.prod.outlook.com
 ([fe80::7c55:5a45:be80:e971]) by MW6PR12MB8897.namprd12.prod.outlook.com
 ([fe80::7c55:5a45:be80:e971%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:31:01 +0000
From: Matt Ochs <mochs@nvidia.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
CC: "salman.nabi@arm.com" <salman.nabi@arm.com>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Varun Wadekar <vwadekar@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "ardb@kernel.org"
	<ardb@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "chao.gao@intel.com"
	<chao.gao@intel.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Thread-Topic: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Thread-Index: AQHcaJAOUX9d3Y9TPE6TbrQ22fi7ebUeJ3eA
Date: Fri, 12 Dec 2025 15:31:01 +0000
Message-ID: <7E7A2433-67DC-4AED-94E0-E096DA9CF3EB@nvidia.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
In-Reply-To: <20251208221319.1524888-5-vvidwans@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW6PR12MB8897:EE_|SA1PR12MB8886:EE_
x-ms-office365-filtering-correlation-id: 8af46758-0ed7-4f50-0284-08de399374f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?at/Fv7Q4lFpmeC5UcHPX9jnXYVIQ6rVmybpTfQ7G68RJNZjY/DQLSuNB3C71?=
 =?us-ascii?Q?dLCNrEMqVLDNZWi4l/1413DYSfY6vzTd5Chzoo0Maoee6hCcQn1iTPPBQk89?=
 =?us-ascii?Q?hYWJI6fQ/0L9A/Mcwci1kNUfhpCKPAc1aFR1bkylmgJJStOalrhnChQauikA?=
 =?us-ascii?Q?/SeB2aygdMbkamRFBVdKgwqX+pJ3ApOiOgeuzU1DP4n6WLBnuvWurKM1UlOb?=
 =?us-ascii?Q?A+rr0hr1T2EqxyvOTP2/41weDnSG292maRk8xYKo/nZt5z8JznFjGCL0wrtd?=
 =?us-ascii?Q?kody9eIN9fXyehVItu+4Jby1x493yNRMs+eIe8rF7ygDe4o6OAAADm0qSj0+?=
 =?us-ascii?Q?mV5XON13QxFd3h4M02mg/ysZ8AueZZKUybC8AQJwxdbq2xLWDrlXqaL+/vsF?=
 =?us-ascii?Q?Aw7vRp063qEpzXuAFsQynB7gyZqNKtw0/bq1WyE3sptZ/64bGBttb7EXVD94?=
 =?us-ascii?Q?w138wDJzSLDKZMG7FBcD8jepzhGHOPYo3MsrCSw8jBN58hWI9wZJ9nSS3w79?=
 =?us-ascii?Q?HnEsq4W95Uq1CukyGPmx/y7xvWXS5uL+uHYCSQBkVtPXVVXFpwYSiFMW5X2f?=
 =?us-ascii?Q?X6qiaxH5zwT7zJdOwhtjew0QeM0O55wQH0KDO2yWkuClHGXpSSv9IItGMMd7?=
 =?us-ascii?Q?sT+jOXZBoE5VTlNWFK8fLswlWdPcxXk4yadw2HXvGE0khKrtLaoC6NjH0nkm?=
 =?us-ascii?Q?g4hTmPqMiSabte3flhxYx6W/Wox/b7RJkgLLL1/8npTZB89TCQurfz82jFyU?=
 =?us-ascii?Q?zfxUodfjjXGTuegVtMI6xCWaXotquPrN4G5znsJ3/u3ESgsnmClvNFRNVdkU?=
 =?us-ascii?Q?kl7aAZsaC0ej0DTuVuZpu5N4fv9Zws7ZOgXjAFlJKVAB2OxbGo9zjg4rafew?=
 =?us-ascii?Q?zTWmZMg3SWT9ytNLvYH5Ji1X+6Nmx5p8nizRxLo11k3JRDX88i7lseHu8lkW?=
 =?us-ascii?Q?nGNIQQwk7Zuuxi1MiAifuDNVfkX2Sid4lacLMjH+/trwwDfgf41GvieBslks?=
 =?us-ascii?Q?cm9ATkY40nqYJGgIY6Jx10RDw8VhK+V2jmDHUZ6xo/WbivEv3NE9NL0c8rpU?=
 =?us-ascii?Q?zkEpIze+sRB6NtFFNIfes4mQyTTbMDkJpnZGE9DtANhVNuNmfFqZhLZDZwEr?=
 =?us-ascii?Q?XKPVTbPN2G/qJ7/grK8i4ofO7YA7goO8NYCIy8DuVqu/6tdObiT7S3YCN2se?=
 =?us-ascii?Q?/2HFVNH1iVqaIfgBxicUVJhJb4+jeOjxwVc4GhxlaKkguv3RU34z3U8niUR9?=
 =?us-ascii?Q?LTjVq4L5gYs010yuXvfaVCxheVR+xgGUR/SihU3dZBii4826hQqz1xdqY8Ds?=
 =?us-ascii?Q?bLROHwqe0xjYHKTWiY8bDcLe/0zUeNvi4kBO4V0S5ZdpO1NNZ/I0xyc22kzQ?=
 =?us-ascii?Q?EmZvwkZjq9XkjanZETA7c88Wvpu4GK8mesbUX5wbdudeXrM9aGbstnKT8fME?=
 =?us-ascii?Q?r/k/H/PJsjr96I4vReK1YtpZwvbTSvBPWjH/CMnFtAgCvdLGFLstcj8Q/Z2J?=
 =?us-ascii?Q?+67lWqy35yX7uFxhvfIp4+72UGp/zV5Nn3Fp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8897.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?17C1SSjAntUBD27o85Zb5FbqRWrOPdiwqMqcfFH5OJugPryutI8+43dWJjXw?=
 =?us-ascii?Q?G5b/+gGCT2v6PPvW9pS4yqGR8QYoUpwHqrJVMN0yAIGUdOxZlpN8BQMW2EOX?=
 =?us-ascii?Q?GY6aJp6pJQEvujJ+eqkmFPxVTp98jUZuF4XQkJYZkTCRSBowEBl/1nbDHvSg?=
 =?us-ascii?Q?GfVNOgkgP2qjABCzFHgPDNzRNyusxbg3Lm7PVH9OHVyhHPW12KvHRdq+SzVE?=
 =?us-ascii?Q?KdVUb/FTqS/A1BBYOwJKs9n6Ax50A8Zxks29u42EwwyUqbSeylVdS9z8okPy?=
 =?us-ascii?Q?dSuKnauR8nvjAPRmt+4vcVvZvKR+CuR1uBRpLG+Sr+fqEE4OU4zBVXU93H/5?=
 =?us-ascii?Q?aIvruRz5n7bgIbhAjHHxu51h2kHAfe9MG6ENCAgCN29XeaQxBaGtsNJBpN31?=
 =?us-ascii?Q?AyKV1V+8MuhuLAQVdiWJcwUUAfOlzXZU36m8Bz8B3jjmCZ+jF5Itgsw8wDU6?=
 =?us-ascii?Q?UgWXZiVad8zZE0GhNzylL5Zrjwi54sxkbaV3TzqQd90CFd+b9fkIvnVAtXfR?=
 =?us-ascii?Q?ZnOJn7DH+QDKXj8YcAlqn2Y4t7AbQ20nnd1xu5nsfTBAQuPn7goG6kyIotDV?=
 =?us-ascii?Q?Xu2oGk6jvy/2ERQFKyo6i4X+Z7FiZxSzqEiJDQ9Kkk59Rv8JoPhIhbVffg+Q?=
 =?us-ascii?Q?VdOAQdNexwEoI3jyGvtkcmTerUK6+g/JsZ4F1Ckff0ScN5noxRHTDoiHZNAj?=
 =?us-ascii?Q?RyvZMi/p9zmwUJWvRut+GHQlk8fwmkwXOCJjdL1XSU/q4wcqnNqsUD7hmOHh?=
 =?us-ascii?Q?6t4h7Wg7Qyk2c2Z6tcSZt0thVjpKQpm9tVoF4h8UoQFNGWRV24LmkDBEg81h?=
 =?us-ascii?Q?c11aYDMDfU1h//6lD89rdnGDwjdYu5NP+9bYdB2SBxEQDFLnrTOSlQRCDc3y?=
 =?us-ascii?Q?I6zDSsjVAP7z4RJ83xqhwuFBBA2r1jotJ5TZ6Si+QESy5U5Q2idDz98GbXki?=
 =?us-ascii?Q?s0iR1/3wUEhfLrTKb5N0nsTM5m0EGFXklovcaQwGj7C+QmvcclDPzAOVC+hn?=
 =?us-ascii?Q?qjJvW8yCkBLASB1iKzWzxlYWndOnxLsJPGa66G6ILeCvOJ9UuvTt1Q+9AFqT?=
 =?us-ascii?Q?1kVBpgoo2cdEaFIG5RrPBjKAXpVmF9qFDgevT6CFWLrDOQ7CM3XAiB/JMt98?=
 =?us-ascii?Q?8N+EJI1nF67ajD3pmlMnTfoebZ8KFJcrCap2BocLHJ3FSaZELmiwze8nlw1I?=
 =?us-ascii?Q?4nqwJmB3G+LZgu255KcsmcTE6Ves5LvFuUkSMAmNLHd/OzGEJlqmFB4+MpI3?=
 =?us-ascii?Q?ugoIWPI0H3ibKqiZxbcntMGSXiuNYdIbMi2dml7y7Vx6CJQejnEJZstP78RD?=
 =?us-ascii?Q?xrTXvovYYFBEFwkTCE5eRa6RCDGdhKzvo2q+mQAJPbrlXi4M7Gupsjg34doY?=
 =?us-ascii?Q?JjZV8ReQaPbaVDq2ttUMAECIplXFqVBUH28VMPSKbTuI79IutxVrIf6i+6G+?=
 =?us-ascii?Q?wLgzeysgUr7wCqHhcwKZqVt9Y4NMe5bpcoj06KhF/zahXnezKA6yHr3KSNBS?=
 =?us-ascii?Q?YXn37HKh58yqx2b53wERMbkViDhPmYrKMeB0tE9l6mGpGzTkSX9hFQfB99uu?=
 =?us-ascii?Q?i19+ZZlP4N/05tNcgFxf2EFk8JfcmdR0SGJf9Vzs?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF8C46A5F8C3C84C9B3859FA14BE95F4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af46758-0ed7-4f50-0284-08de399374f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 15:31:01.8309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aw2RaKoADn/20B+wEav0iINOatz73zGJYfg73NDa1NJXug5CtTiq2CxHvf/gVWxvhhDWP0t/iAvZukWn7o9AaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886

> On Dec 8, 2025, at 16:13, Vedashree Vidwans <vvidwans@nvidia.com> wrote:
>=20
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> index 0e420cefa260..24916fc53420 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
...
> +
> +static int __init lfa_probe(struct platform_device *pdev)
> +{

WARNING: modpost: vmlinux: section mismatch in reference: lfa_driver+0x0 (s=
ection: .data) -> lfa_probe (section: .init.text)

__init is not needed here, please remove.=
