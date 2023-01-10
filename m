Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287CA94F
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 19:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/Oh9A+n9Wi5T3vrPbuId0a1nfyf3Zc0VQa0oeOYr2fnESxWOSKQmH+2dE63b2NwHbvQfBPwdXLHLU/dA3hx05D78DwbtM/jAt8JmtWenN9Vdv2z/qnGv6Q7zd2XM6aFj25cxAeYhXMaTum8emznc2Nmn8IT2RoV4vui05MJumkQHChFW8/IEhRXTf5k3MZpWQ2qSxxB7sKcC77WyG9TI+snQM2fVHdv7dzSIbHJLCcqtXi71IB/1pPdbxTt0LeQFRhrKO+SCBMcSY9+0GrKxsfprdYRPx5TI5wdOLr7eDXXfNE/BQ6lZYHK3j27b3ZjxOSEbWoVivlINqMIN+OPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrivJ4RllmXjzz0VkvX4dyRRYj3ZDnlnmm+wzc+/8Aw=;
 b=iiC6glX1q5/qvw+5rgiMYZVjVdXVqxC+a//h1OZUDkyf10dlpUff6S2qnnNDB3Ds/9olvB8zMqluOIJD/HZJYDPqu0aMSjh6TY28+8i4rQR1RVpXUkUfvKnOQeOQ2hjuRjQx9o5kVyWuLArgG3BU8E4ejSuDRSAuzDbr2f72KTToNDszT6kC3gYoY59hwE21zNqbsRQ9i6VMqrIbMIU8p0O9YaN96N4TO3WD4dS4lIZbBR2bWapne3BvzEFvH1nE9B8mwooRZxRlyIHUeHCFqzqkoGE9GF7/DN/+L0+ELYu0z0OFryXP3PPFbEMG9BEP2M1OB1jqBy6klM/dECFHnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrivJ4RllmXjzz0VkvX4dyRRYj3ZDnlnmm+wzc+/8Aw=;
 b=FIsS7Pct9s2wSjQlTyKbVprvawOqKU1NNbWHEPp28MpM2ZRBapulj4dxnP4WFoY8sCmqlMmCaYP4Pi+q78s9Nlm66L6QoSFC937inGGzK8O9vGS32thRRkItllvkjP9uBu700zPprL/e/aFkw3yvwODvnnyYgrsMZ3Hf5IQlwbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 19:37:41 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 19:37:41 +0000
Message-ID: <a022f10b-dd2d-9e66-a713-592be51b97bc@amd.com>
Date: Tue, 10 Jan 2023 13:37:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:610:53::37) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 6305adb5-ca24-408a-ea48-08daf342236c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rITauUfmvwP+xQJQVAkH+nZtXLPF7hlWtDLo7VJD3yB7FjR0oFBpdhB01A52cXpGYe4dv0mbGYnbhMzrtN4BBJJ1kXuqo/HbVx4+mLgJrbU2UoPzxQAX6f9+SSz7OZuT8070xER8pB+9N7mh35Oh6i5ELsaNHqLI+3Vj2PaeIr+PnZg8gdP/Ip7p6mTogA34HTzHCU+s0HBPbiyLfX0uDM9ZPl2v2rcDQ2gnIXXLqkBX9EPRWdIQH2Hhatb0WqSEHpeSSQ6wVraza/ghGY09caBJtNvSzAF7feSHP6vP5a5QdzM/I6Hej+NsZIEWaJNqdyBv8DlxJb4wuF7vdeOQ1SJ2U3jM5oDRAA/b0z8vpEOp5+B5O35ZbzaFEJV4siCsiMyK3OTZE7Z2eXpMhF0QeNPRg+TZPhwa0qkZcJWjMaC4pFGP6bX1JXYDbRA3vt1t3WV9Tp3SsSwb8SxQU+lPKO0/VYDOWXy3fD10I3HvkN2WvtRupuYFzoFLjlswNtYQHpHHaX96s4w2V5NhxEKOLcWtH3C2lMLzeB3OTU8du1vhlOPMj6h7OvG6vxfSjNVmYckD4Pm6VZf6CKCROtbSPwIVf71nqB95ShMkLJw+mg9KCRex6EyeJpyxup8pUt/yhBNwhSo3/q2igkVkRpVcMbHEHRiWhWW7j78N1EOGRdoJHz9XCKsvnrBE5hIFwGN5Up3yFKv6xj+Z7LCyep17WoWLQzXYnHtpdMS3Ukl/6a0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(41300700001)(2616005)(110136005)(8676002)(66556008)(36756003)(316002)(66476007)(66946007)(86362001)(31696002)(8936002)(38100700002)(5660300002)(83380400001)(4744005)(2906002)(31686004)(6506007)(53546011)(6486002)(26005)(186003)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHdZaGQ2MzhveGQxc3o3NUJJeFloTTlZcFgrUzBJcXpTa2lNbUlkMTVCRWtv?=
 =?utf-8?B?UURjUWJGMXRWM0R2bEhFbldBbkJWS0paUFZxcWpJa3dMeWZNaVpIS3BEZDFy?=
 =?utf-8?B?aENWWmgycW52d1UyRXRMN3pjc2NieldETjYxRGJ1TDZ5Uzk5K0tnbXRjVlJI?=
 =?utf-8?B?OEFWcU4xQ29aeStjVm5FNlJvQTl5SmF2UzV0eDdMSlVuZ0xvdWE5TW5rblVo?=
 =?utf-8?B?aVVwd3VMSVBQbmtlY0xEUjJ4QVAzOVg3emcvVXhKTE9RREdFelhWbUxSZ1JD?=
 =?utf-8?B?cHRKQWF5VGp5NUpMeS9MV3ZOUjVpYXpCb1dBRGdnV0lLT1FVeXJLL2ZuK0J2?=
 =?utf-8?B?QnpDKzdGMDcvb1d4Z1NZbG1pQ1hsVDJDa3ZuZmEwWFM3SFBIZ1YrMjV6cDg4?=
 =?utf-8?B?eElMZnhPK2RuYXlFaDJKaDh2SzErcFN3NzczK0U5bFkyaTF6RjVNTHByNFNr?=
 =?utf-8?B?dExlSysxNlFiaDJMcHV4akJzS1N6OXFvYUhTOFpMemVremJZM2RHVE1tUlpR?=
 =?utf-8?B?SFA0SnVEWURId3hMV3VybWpuT0dlcUwvdkQ4YUpkNHg1RXpzYnVPNTlJRVdo?=
 =?utf-8?B?ZklRdFJBbHg3SVN6bENRWDhJRHF2QjZSUDZmMHZ0dFFqa09xdXc4Y09YU2JS?=
 =?utf-8?B?MG41NmY1TjdKZ1V5T3pwTE85YXJ2dHFHNHZWcUhnTmdiZXh4NE1wV3dKTkFP?=
 =?utf-8?B?WnNOSG1rczNYd0UzWm5jSDZxS2VJQmpsVFc3bDN1aWRIRjBjSjJYb29HRWl3?=
 =?utf-8?B?K2ZPNjhxRnRBU04zbTdpVUdWTFlZMGh3VjRremZKbkJkVGxpVWNVd3pXTXdh?=
 =?utf-8?B?YUVkVG1vUzRuS2VremsrVmhvMERaZTlXb2QzdG51bEl5eXdYcVF5b0luSHVK?=
 =?utf-8?B?K084MlRGdWRjWmtLVThtbk9iQ2VUN2pxQlN0MkJxakd5Q0ZjeDRtY1RpWUtP?=
 =?utf-8?B?R0trT01uaDV6dU4yQ0I0TVJybDI3SFV6T0VMVDBSenVCeFlFM2tlQlVCVG8w?=
 =?utf-8?B?RW5mekZxWXpVcEdYY3NYOXNnR2hjdW9hRmd4VGRwWnlpdG1vY1lYaDM4UTVD?=
 =?utf-8?B?ZDQwaUpWbzBOMGRBOFB1M0Q2cjBCRTNJVUphMkNoL2NrdEhGencvcVhiVFJD?=
 =?utf-8?B?b0todWExdmExc0pURzB0cEpGa1o4aEVWMjNBRzIvWTRqUGl6dkphbFFTQVFM?=
 =?utf-8?B?RVEzUEFnSlNuQ2FrV2NlcFlCWnBuQVZua1ZXTGxpN2M2YXBsb2luMzR5RnhV?=
 =?utf-8?B?dU0vcFNzdjdFUjJuYTdJb1RveUtudDkwNzNsSUhjN2dpUm8zRHYwYnY4S0FL?=
 =?utf-8?B?YVd4bldkZmFtWGdJWFZTaXZpN1VUSUMxZ0ZzUzFFaFNSUFg2ZnNKZy90S0Vz?=
 =?utf-8?B?V0VQQXk5NmwrU2p5Q2VQa1hLZ2l1b2JFdFh5dUxlVWhKTVhOcEFnRkJOdllv?=
 =?utf-8?B?T01EaHlaNVQ4ZDNEVzFpQ3N0Q1d3T29CVlhtY0haMXVBWmFKQkZuMDBBMFBX?=
 =?utf-8?B?SE53bFppK1RtSTR2aTh4UGFQVnE3bHZQVWJlZmhDMk40L2N4bmFtUm5pYjJp?=
 =?utf-8?B?TEtyNVVEN0dkMUYwTjF3TzI4aXd6WUgvRlpnQlVSWVFVMktzQnoxTFQ3NlY5?=
 =?utf-8?B?M3p1STJOZlZqK25qYVVXNG5wVDZjalQ0UmNaTlJFaVczQktrTXRKb2drNjhi?=
 =?utf-8?B?SVpBcTF6b01GUjZmK2o3eUFXOFFnQ28yN2t1SlJ6cDhiV29nck9SN1lnS0hC?=
 =?utf-8?B?S29pRDl3SndHM2VqRVRKS2hjcHZYYUhWdDBYQ1haNHZ3RE1WSEJVU2h5aFQ0?=
 =?utf-8?B?OG1HeU52YklsUUVwS0pmMDRvUWlIY3J3NE1CTCtySWE1ZldUQVUxYWRyY0dz?=
 =?utf-8?B?ZFJMekNCVUZjSVFHcUpxNlFOOERsTlI4Zm1tRmVLNkdGcUU3N1ZPSUJtT3VD?=
 =?utf-8?B?VkR3czdkcS9zenFNZkNSdXBQREg4VndWN0VYSzNiZDJUUExoNXV6bzNDK2FB?=
 =?utf-8?B?ZjdCR2ZjQ0FaRlpxN0xHa2JLWFJSL0l5c294UlE1NFIySEpPNjZRb0I2Q0h3?=
 =?utf-8?B?Z09PMXFBYW9vMkJkeUE4ejBYclFoVVYxSjVnNlZOL3hNUExtT21FSmtrODBu?=
 =?utf-8?Q?FlfTcyTJtL4B6thXvyvhs/pef?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6305adb5-ca24-408a-ea48-08daf342236c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 19:37:41.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRhUHfIM+y6Eo7yEwXJWmwjRvy5LJVAUnJJjQH9chE5TTBWGwSD/vIFaJwjQ6rhAD20K+zzzxL8jnxii3qDy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205

On 1/10/23 12:54, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with added 
> support for an attestation protocol and a vTPM protocol as well as other 
> miscellaneous changes (all identified by change bar). Please take a look 
> and reply with any feedback you may have.

First feedback is that I missed adding the vTPM service attestation GUID 
and contents. I'll work on that and send out an update in a few days.

Thanks,
Tom

> 
> Thanks,
> Tom
