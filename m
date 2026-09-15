Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B813BED4A
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472768; cv=fail; b=TKJS7SHot/EVVyCFf9VWO0bBLc0CDvT/oKybeVHPpfDIauTz4omXS7ev5vTRxpMyW5ZiGNcAWkMXUHAEPTmhzHV9VVarOnLVhebF9i2iA45904ge+B4+QGIMducHk3NCHsFrJGudO1rdijw+X5099o2gp+9gWXrAMQg4rmqc80M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472768; c=relaxed/simple;
	bh=VKei49+8Rewr5VCqdzwtoHb8XCqV4N7IuIbq04Ve0Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QtCF45ybzOejUgakktAti06NZ5nT6NjhSOKEeEdtGHHYqG+n/QJJ8QoE8MID2WeLP/g3oFEZX1To5o8cm/9tHvd12O57Snd3/DN9hl6WtNK56MgioJxtBJPku7gREqYVlgIsm22QdBjWlvfLYpzBPxCQ5uea11Z6ODOKoTI7HPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i6sbTwc1; arc=fail smtp.client-ip=40.93.195.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i6sbTwc1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCfdu5kz2ofXEHunv+j4NaWlf1OY01TJivAe39NO4JSTneVYhxsSmLi30P4+7NlPrWrcjUpP3elAi3UtLi+R+r7WPvvpzW8pqXhiDNED8TYEH78f/fsNmNZDusX50YxrUilPJeqamC+sbmIxxBSIKs0StMze5FqDTRSSnEG542GxWvbzeIMp1YvE39sy1R2PGbnonuUENBIVkfIN54qgy+LUuJEEjqhM+Ryq5r0ll6GYfm1HFcEcdjlB7di7MskO0IPkHsXrgYWBuFZQCBgI00OJGkiQ3NfWaoXThVMJPqobexs2dLbNmwXhQY65zf8icxUlW6PF0plVuTNVgSrQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv6PoYT21mKt2n5oiPM1l4x7MlGcka+A+8xZzcRclYc=;
 b=wocnU5HXpjhHgGSQsOHxYmOJgELjZacNgC1gpKc+wOTCbGpiQGzCQQaOTpNOHHO4foN4e2YYnd+zlKKsweMt52O1RVgd1JQzSSLlKiIgIi/5Ph7jYaQEVzgPxsiUeb4XKWIBw0zoSube7TxKoSIs9tHnUGR0pTYjR/aIn8esMR7PLQ8acBJyrSrrAPZp87ZOFqDF1Ku24Pn7zXRpfz39AZwLkS9Er/HZ7tLWkWBCLTOvX2VE6iQ5DUitAFlpcK/yiX7L5x4EkzRAQl5wsy5WjEBRI2w/1JhH0aTMplEaFU663RLNitnxVJE4oTGga9vQvoXQ7IUA8g9U6u+Y27inbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv6PoYT21mKt2n5oiPM1l4x7MlGcka+A+8xZzcRclYc=;
 b=i6sbTwc1E0JxXlQS6CTbp4CAsixCnZ0Pa9ws9+PlIXImHUI1foMjFeYNMYQh8YWVa47HMS6ciukLCSLdKUdDTIA+U9TSYl1nTPKCEukSW18yV0H6Qe3LrBT9ratdyKL4GmmBHJ0LCuVbI+jugMrnWbKd3HFS9dlPzDp3j5a5x9wbbiPTiACq/dSibRuAj2Ecv+no80F5379WJ0mXKBqGKz4Ehzb3vAKcuOQdlvLoRSEuj26w8CrzN4UOU+tgjWiFcO9JAo0ib+Mf5cg66+5R5m88Z9+5HGbiKeJIeE1nGDtD6BsoTiwWouYMErp4wrD2dB3WMD2AIsHpzPeaySOYaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LVUPR12MB999183.namprd12.prod.outlook.com
 (2603:10b6:408:3a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 11:46:02 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 11:46:02 +0000
Date: Tue, 15 Sep 2026 08:46:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260915114601.GQ3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-2-aneesh.kumar@kernel.org>
 <20260914133249.00007d35@oss.qualcomm.com>
 <20260914222836.GO3968357@nvidia.com>
 <yq5ao6dy27jt.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6dy27jt.fsf@kernel.org>
X-ClientProxiedBy: BL1PR13CA0338.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::13) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LVUPR12MB999183:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cb3b7a-e2b2-41a4-8040-08df131eeaeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hNzcZVKYENBf1y/+L4wjJ4PvLPsxMUlpiiVmt7nQ90HhvZR99VoJts+naaVG0zbleq45Ng0As+qvHhz8TROcBnyyfF2sjHB2I3ceFpMVuidO2MjpEtV/4RS+pkmz/+/IdqY4YiTuj5d1yhEWaHBx+MYNy4W4qx2lqVE1OG9ahXcww2vMYwsV8S1hOqHrLAW/q5mSiw0N8HqZBpdCPf4esUBw2MXGf7Kc255KbfzejV5lqX0hEjZUdnHak6n03jhqbaVYaE9KRM+Qo9fVxOFI6cVyGmYKLPgb7lbUi8Zr9VMkLVk2AOj4I2IEInZS1ejCpdNaiDNnt5PKscgS682f1tbiCEgKT1tGQFgRLvmXNT9rhIj/AKaElQAHbYc6ozHdcNV08aT8eV4LKG4M1gjJTr4yYu/9i6enuhpK+5e6WY2KI2W4J6sv/nqAOfsv1JO7Vh2nRT0ExPwDV/4V8z0zYMV16800q81f5n9JTREh96tRdkz6ngf8kuFXLrbqLQ2uCSf1eN2Do+n2MT6Ox1TWOoN7oxOzVTdt/+mmCG907rj7X4xT4lpv1Od25EaPtEsZ0TDEiudqkoEgnT25w6y5vud9iprpheb3mdLP2WQsfRnh4usT/wJr7cN6m1o+p/gN8WC+vgKUzwN7AQB8MQ63LZhTZeTT9lceLVUom0nGWhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tdojsSisouO4wsHvqdDwd38s8aMeq+Ue2xMJbpFUi21vwzRq6I+7yphMniUh?=
 =?us-ascii?Q?oiRMrji/mDe6q6LOz7k5s0/3PgWwzBdeT1lgxU58rkHsGdcCDHHwAP6v4/+m?=
 =?us-ascii?Q?wYMsioqawd2sHBNw2mMRhbM0kvthEvWtYGKdXs+sTlGdMHioqGkTbxG4yyhZ?=
 =?us-ascii?Q?TtdGGFTPVuRlkDqCAsBySemmKUQK51fRyZAcanxQO5ICUxPNRonfBFWOdgzN?=
 =?us-ascii?Q?qnOs38ubbmr4VCqai0m4VoHnZ8CakS0Ib6mc3UmIWGiav4ScTYL/YlU8afjA?=
 =?us-ascii?Q?ShzT1r3wDBkpwB12wf/FmpTME2nP0JKBwNQbTGbFT+pWOqlx8SWJCsC5WvNp?=
 =?us-ascii?Q?OT4KWn7xya/VWw6SmjCOTpcvdjq7EWB+DVZLKYQyOWgOzIycDbhMVXeQ/4ti?=
 =?us-ascii?Q?YcrEj1hYU3n1gL5FUxZULNqASHmFpJMEWU9nGijb3vRBPpJuH1W/W/7U9N5c?=
 =?us-ascii?Q?gF4wX5+e6veewLgN5VLZiiR4AnNu/H5GyVSHLgiVVC2vky1kCKCIQUP5XlKx?=
 =?us-ascii?Q?3CaD9DJJm5ue0mEpxe2zUySaZI0uBSqRsrlsCZUXvOVIel10DYNcUgc1JKA2?=
 =?us-ascii?Q?agouD3oI6xAxSzjK92EuH98s50FHKXP1k3S1APMfbrjxYUxt4FtYBXX06621?=
 =?us-ascii?Q?8M4A86xb3oAQ6rW16z9ECSeU+Ur45/6L+O1HrflpjJ1/U2+jOK9W37TUKH4d?=
 =?us-ascii?Q?+fjVe+rRhwApz7Mx0xiR+YQVHBd6Cu1TEFGRsLAvaaY7MMTQmjyT3E0P76mM?=
 =?us-ascii?Q?D41VEhE/g1CnmG4CxM9hCavxGCjYxzqa1d0xRcXIYU3UsNLZrnPy/cyZOtCJ?=
 =?us-ascii?Q?25HqDM1wkXqGsM+wrjGvH94vrWiHh0XOqGQpvpRnzZA/n5KF1GeDjU9gvScD?=
 =?us-ascii?Q?lM8rs7ng063kpzHEFSDwEFi4c+ZlqsE1YFtPZJQTGOag64Eb7YgJZKuMjJ4k?=
 =?us-ascii?Q?N4vxC4XaXdUYqyowhO+sV82FGcjjVK9Q8QqQhLVFi9/cIqKo0Yr/Zr4klTSZ?=
 =?us-ascii?Q?Xcu0Y43OV7n12GZhfBJF4ND9f8BbboM+epizBu4ORTDUT6oDWIzKAI+oyVAe?=
 =?us-ascii?Q?9JcVyM/jmtTpo4c6K5RjFzmKNOBHYJknBVwNqMou/axRwfo+dda7jil8X15k?=
 =?us-ascii?Q?qN7BGnOQ7XfUJT3ICiJSoJ6bJxn+yVZR1Vva19FxbpKkrQ1F+JJd4uE/Md+s?=
 =?us-ascii?Q?S4+uoXsRvA8YOWg1DWjfBfHzHjQHs5qtSJrOCIsLOCexAymSUB6jpfoZDtga?=
 =?us-ascii?Q?zl/tl54mhV/Dipxld1WsAhIzFu/6wVyTcFKnBgcTYCjOygvcgPx31lKCkNe8?=
 =?us-ascii?Q?ZeslB6MCZcolaXIQNAYj77v8UA85gTGlE/41I0ZWfsJFVzxfs1OHiSO/CeZz?=
 =?us-ascii?Q?TcKvYVW+t8x938Myd+d4i4ilB3Wd+nNqD3Dr4pGz//XfuH0jpmoGXcDadf6C?=
 =?us-ascii?Q?aNuSha/YZpcF5HX+caRvoheiQ6NxTk+Cwj3LjTBb2bHa1ApgTrAVDKFrLI3n?=
 =?us-ascii?Q?g/RyxQHcQ2W0WCx5UaZ2d8fORyVO0dyBb87pq4dTyXk7nYOE+RHESjt2EdII?=
 =?us-ascii?Q?eUL3fYZs+cqAemRUON4ridHeFi+NI5457rU22KNzyAre3gDpAn/y0FlxRAvh?=
 =?us-ascii?Q?0QmD+IvVki0BHEpxDLHdjrqr8rfBX4/vXOwddVIV7X18Iwvi3u9rR5KNQRPX?=
 =?us-ascii?Q?y2grIz1O9itBqErRT1LCyxFJQaiRva5WOZc0KZ4F7AuSpCKI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb3b7a-e2b2-41a4-8040-08df131eeaeb
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:46:02.1882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN60cRCQKq8lpaDvOsDxbh+eXUtS8qXqLrf93Yad13zEqVfz564625U1iptEs0IV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999183

On Tue, Sep 15, 2026 at 02:52:14PM +0530, Aneesh Kumar K.V wrote:

> > Yes, but as written it is OK, and this is a common pattern in the
> > kernel. I agree it is fragile tricky..
> >
> > Still it isn't an urgent reason to change it around, but the best
> > pattern is to put the allocate, dev.release=, and device_initialize()
> > in one 'alloc' function. Then the other function calls it and always
> > unwinds with put_device. Use device_add().
> >
> > This avoids mixing the different kfree/put_device error unwind regimes
> > into the same function..
> >
> 
> Something like

Yeah, this is the safest way I know to use these interfaces

Jason
