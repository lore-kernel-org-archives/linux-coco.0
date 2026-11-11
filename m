Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794409239;
	b=FGV9YQJyUWTriHsPHr9GO/EpYaul0Lbm6NTTFXRI8j8wNaM7lWP/SooUM8dhfkIlrZq3
	 XxOjZQL6txIyqXI+JL8APkiY1MvkbkWg9b7nyjou86fs9Tgc3boijsSMUixGllzsm6RGo
	 IPwEgDedzcaZtkR1NBrj/qN7pWDvx0VYjRENA/aIGcWhntJZsZfZsrUbiiVPbd9aP+4Ah
	 1Wz7cup/5hcKmSYYFnxM2f9+U7WW0Qy1w5RsGcuujkSmNoqwaI+O3zJx+4YzNabtHKLoG
	 D3FQmZYPMhXFEwVkIMzSsayEiZKHMv9rieD0tc9dAvnRWB4e4P5o74xjNduBrq/Oe6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409239;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jEgBOX51oxGk0zNP8LBUYHnZtRiLsW6z1jYKsV94y38=;
	b=KQELLl/Di2ehLDVAHF0S0ZNLm90+n8Ld+wPlC1RuHnSIP7QGPTrGfWE5/8VB3nAYqF5/
	 d5pz8NfmdmNmEkgTJzQNCSoKfnZt6alOUYyNCBkRAkxekCuIMfQR3QEkO7Wxpd++UYL6B
	 HREz7LTUSJMNjL/0Nia7kVcGC3onrJEsRO/byxigDyh3+eqX7dN8N3ZT/7CSCLQ7MC1X+
	 it1UDplYtBNk3Cp4KqnLnIJhSnYG8+DBdNBqI3yrKxrOAHga01B/36djAeMwJvKlU1IJS
	 EUBkBerrhz0SZrG5ifvFw/b2l5PKdY2D0qZeKxea7+zcfytHDzFQaplYnFmYPPN7Dwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I4tAeXCM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.63
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC3606A8BF
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 15:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EC3606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=I4tAeXCM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8n+RkDDOPqpn2iglr64EM38nhUiYv0zZTudWPY6TCbXiuPZNqlB+NUyD+OAWoC0SAb0Cb8OJt/O7DpOXTjGyLfDQvlVDlSQlPZR25L0fBoHeg/QwlTVw0RA2PN5WwffEAOP+8lZzDsxsWdzwLgYcWp1ew1bVdq9YWQc7B2Ybj1y3y2n2diVKfppKJ1bgv3OajoCDnUNN6zhKA9wmbwfgsq0ib6RoNnUXTX0YJcFXjDE9Gn9YgcpFK2zGu9C5QR6Sh8pX1OhNNpE5Q+nNFGKAp1QMKqlRqcBV+tHFHkZRajeeasfrrxvFNOUM5nj51wYopcA6+AIdmcLHJS8BZIeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEgBOX51oxGk0zNP8LBUYHnZtRiLsW6z1jYKsV94y38=;
 b=KOZfnVJCUnozshzwBOfnDaViftRUrHzvbRMkHflzDCuJimQ1rkjY54/0HDmlLyyrjU7PQj+6ROr+qJJ8SKgaHSZ8iMz6tIoFjY+eo2HxKLzYOlgOfY6/0/vrGdGu3KyjrPCr/vBVum6Z8B2NBujv4MkaRVKS/p4sW9gLW9ffBeUO7nHSCH8MjG4oY8Z9xA6g3AxRA/1z4yk+jRusw1HMOMCxK3yBrDuEqSuuzPXNiM5pJ63dccIXmVaXeAN1+7wtk855GvZBC91pYQTfG95uloRnOfEkUIf9MUuvh9cUhEbI4k77gqxiGYXu5nZDmvofke4IyuGxFgWJFAhEOg2AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEgBOX51oxGk0zNP8LBUYHnZtRiLsW6z1jYKsV94y38=;
 b=I4tAeXCM+Ou/oPgfieo5moBHof2CgGP4IDfuX8tWH9ZYseYagb3cLu5lVSXbYcWI8kicXReHEvHoleIckD0PSdRPvUbK8zNEXYJhkoW15+XJWXver0V+lgwwlbwGcb4ZYtdO/5LSJ6UPy7e34p3dI24pETyH19S2blIBfd88g17eRE9hzc183j8PiMoQ/WIA3deQ40lh43Qx/sG/4F2OwfSbUS3F7c1IWghM/d5ZlrBx+5HOOfGBZP4hgmk6AM36bLLcLkWJQ7rsQ1YmGp77jR/3VOlFvHYYuEIEPvUNhtlBb2Kg7Ju+TATlMIy04YzrL6HkY++28aVCAZ2K+HBM6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB6018.namprd12.prod.outlook.com
 (2603:10b6:208:3d6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:00:31 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:00:31 +0000
Date: Wed, 11 Nov 2026 11:00:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <20261111150029.GJ738765@nvidia.com>
References: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT4PR01CA0164.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::6) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e845fc-6f58-47fa-3428-08df400487c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|10067099003|4143699003|5023799004|11063799006|261028144727099003|261102123227099003|261021121427099003|56012099006|261022105027099003|261026140227099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	5bfeBq21PTdWtgbO/quYKCB+xOzG242+9lr5V1qpsW9v41YcIGVNuNfhUXLuwunEi54ghi6kw7LedqFLVO2ku5Tu5LQyXhuk/1qJ/oS3JgtzuCDg2j+E+DjilUfJgMPMuU84trC80wTxx65BrvCyn3YS1fZGbMffv+PX9xOUEFJryEKa1a3CMONEIVMqzxf4P8DirUYkkrfsTZ5WkWmE3+Eu0bCvAOvZnNH5JVamaoGz19Gi4rC2qrt3HFSytjrsBZhfpW+pV16tp9SPujA0mV+JgBKW7R4j5wWAjNr2bSWlAKtu0eO5zhtS0CSP3JZMVPfL7IFlBUplhbTrfBbBs1y/vrjH/gurze/LKkuXJVks/xRSXXHvYZWeF2AmMb04nbbicYN4pw3bFQYHKTtTaBuWOIKkPg3DynraYm1AtvUDGqv6a8ZNEXkoVCVscZUlpWtOeRk70ixDQ34Hwq3NmHElw/FZpbrPfGnY0wSfbiuXi2fWs4kKLLoPds36o3hub6bPMu4rfJpHipL7CJkzig1cRYh71acxjZnR3rGpYPFSn+Pf1MRkg+HS5i6UbSS+2PmZh+gLIqBKaEJS5izbFwrF7iSnCgG4WNu/e/PLCsS7tVeSbOqfwd2dJXeskgwDsGpiIqKLehcoVfYwSrYpLcQnWOyc52DHy1XnroZBH0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(10067099003)(4143699003)(5023799004)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vrv7xd5yytBSoijoqHHHoVifn4ZpnJiqdkGGaOy+pS1R/ZlVmKSnoLYRT/fF?=
 =?us-ascii?Q?FHWGpgkrm2f/7Y9KQic2criJnv5r15PbHC+frSsAjd+ZQro+p/0/V186+A0k?=
 =?us-ascii?Q?fpz13q5cj4ZLBfJe7eAf2ZsS4xHc3Uphw9jaEJrq6A2FGS9MMfA0u9EWSN17?=
 =?us-ascii?Q?8vYl4imhYLu8VIaeE089pFRC0CQn6KTpOxAtA19e6Qdx0/TH9Swz7u7fmhq6?=
 =?us-ascii?Q?kp3fGC8kHv3Qoo/+veojCtMItiL4SlTiY/rDEtfr3iUuQYbOzKc3+jaTmTmA?=
 =?us-ascii?Q?bac8mNHF4vgN2fAZpDgLITsi5APTO/gemLCLbc8HmJMQnDCAMjCh8YKT4euC?=
 =?us-ascii?Q?HYXzFcCSzqBIag39gHPYIe2ppfz42phRHnvjf0u430LfYVoKNrQFZX+SOnU0?=
 =?us-ascii?Q?f3gajtXe8AecexPm1TDh0XCv1Z5HKcSbK6M9NzX1A7oLfA6sADE4vkodIXYB?=
 =?us-ascii?Q?KWmKLkSV0l1TlBVLJgcWuGRtrHezgMxhx7rOeFUwJNZWme9vuwk3wJw5kG7r?=
 =?us-ascii?Q?rxvyTLJ2UfgoTymcruFeS4r0yBb+mGS7q1HIuMxqbN+9jv+nWQnSKvRF4wGV?=
 =?us-ascii?Q?62ESIioejMpVWt93rF3CP4JqRBVDGRFDxWvN5E1vuSlIWgdXdb8i9Slz2Chj?=
 =?us-ascii?Q?wkWD9X1aDO48opW2QgK86ILa1ZXzkQLWJYVSPPAvFT0oEyRDDdgqyPEyfS8M?=
 =?us-ascii?Q?Hr8fjaI0scFzPEZHjTcK8ysmbfWODhG5SGRYK0+W5xD8Nq0TA+OprEoO/JRu?=
 =?us-ascii?Q?P7/jKdvGu9ZR87n1XwX6acw/cCFq8j45Yq6qvYz0m2VrKXFs2JB25NvGqchO?=
 =?us-ascii?Q?wWaJ/xWw+wed1/vbcu/45ejBHw1MVHMUfNuLL+9i+39AYNm3kWf6SgYr4lJE?=
 =?us-ascii?Q?qFTskqoSztLVwIWQosBKEA9BliTXqA73odUfQ2aRmQ5bCKskbm6ot5lpMm0g?=
 =?us-ascii?Q?FYF4391pEM3BZjRqFK/LvPiNpTL0bJ6OUST5auxSnVFHiMH1OMiyFWHzuvdg?=
 =?us-ascii?Q?+U67ChXF6h8wGBXT9/TPLMAv4fBkTpNWlAzET3UBnB1VbscOxJnEHiCtKys0?=
 =?us-ascii?Q?r2vLwQOZsx3P21/K1KJipz1pP4MM0xHtfgYaygIBHt+XDtkZL9JTgTgDCXFF?=
 =?us-ascii?Q?cTkrBERCFHLXuJU/i7+SXyCK3d7HAR6L02gdPEWyq2fc0vkuydHjyoOLYJoy?=
 =?us-ascii?Q?5ZiDlXupFVxH9wF1F38cOsKhTA9wVJckPrLpfbexMOFq66Y5MtBtldkWhWgp?=
 =?us-ascii?Q?zUg1QH6eBj70ApbR3iHd2uFKdFiOT97UokrGqb1UXgC64CFE9f75wrawZEuJ?=
 =?us-ascii?Q?oLTFRTZiA3J4bqixJ4bZmGMJjumxe0+QyXLM1EzkGYWeTNNWU+6mDjJKKGLy?=
 =?us-ascii?Q?SvKUkj79NMcJuaknEeIqC0Q+3BeJbjRgQtNsEAUnyJ3FxGRFGpe5OUrz6jcg?=
 =?us-ascii?Q?bl+EcF1Svcn/IJ02d37fVLitS8xpBTG3wXnQMVnyK8Hvpk4PWak4PlN6vGMu?=
 =?us-ascii?Q?W4REpBDHer/GGZzaAhLCuVGPxmlJnoU/BWYuPUNWlakZYhk5leo1fyajbDR5?=
 =?us-ascii?Q?aIblxBaHxSJvF/1pogexAsCQDuO0vkvZ1pGXPAwaOx9tzzRynb8QNfQY+vNy?=
 =?us-ascii?Q?iwvfeYbahZLsHFx3sIg2VJLgnkIzjrppMFMKwhle2Cr+S5DTW4OGvIUT2WgR?=
 =?us-ascii?Q?8vauM0UFzCb1Z7Q6geBArpRsMh8utQaem25SKifsaQsGtJbt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e845fc-6f58-47fa-3428-08df400487c6
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:00:31.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7pxb8CyVH4Kg1jdqiLoDF4rqGyWGBFkELK+va1lBjZ9nb9SST2Ww98IJxQASzvC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018

On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:

> The interesting case is about such failures after attest e.g. unlock
> which is supposed to be a void operation. Maybe we don't need do
> anything special in tsm core - the secure firmware maintains the
> state machine so future lock will fail if the current state is not
> unlocked. 

unlock can't fail, we have no way to cope with that.

If unlock does not result in the MMMIO returned to host control then
the system will surely MCE.

This should have nothing to do with a crashed device, the disposition
of the MMIO is under TDX module control, revert it back to host and
accept you get AERs for the incorrect T= bit if the device isn't syncd.

The OS would have to kill the SPDM session and FLR the PF to bring it
all back.

Jason
