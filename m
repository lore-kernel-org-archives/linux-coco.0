Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405872FB1
	for <linux-coco@lists.linux.dev>; Wed, 23 Jun 2021 04:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UESQ6t5z66IGXaYdYmwasOh9zdMPx9ARWWdws+nEYQ/UsDsdA4zwGX/7sDsAXtI/lWQQi8Yz+fNhD1iReM8X8xdWrYf5NdGV5RMs+YWcDiE/BVehc9H/EvyoodhUnSrRkXT0eS8zUQhl94xVOCzBjNXD0L5mBW4PsOHIVN3H1rDRpFwHCGwutPX8pZkX7f3fTTE6eXg74CXCXI9HDTrJGn9IWPtXRWaUzB/v1ZmwjLlT1aY0c8wr5ke9G2KfgbHkufNqcC6bM9ayCWkSqqZ+EqiIMS3CxmHSHBEsIYqn0FZ6ccwrigFCe389YXHFqNGTwrLakaGtfSTVGkRH1VeKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCADq1fK+pEz+9zZAVb4hQSgjTpyDQbDlwk7Q8HRpTY=;
 b=PiRw+v53JQshuZSeVDW4ot6cQHPT7ovuDNumBR1k8A7ecMqpJeHuY3GHKERWWSHunxuVPco4f9I5mbJhL6ZQvKZVU4zlWeLr9VdHymA1Gp5jeo3tB4kNF0XOJW/XwkK1p3HSAKi5P5LoowxzrZgaQdYWpgm1Liw4sY5SOtdeAwnx+8xkICF69CX2g/2aMPx4Fx67ebW+O4aLSwmNCLLD6EjI0NzK26a7z+vgzjAAY2CxlED6ZhP2Y6AxCX8+XQLneKK4D3U4LiIi+65AhQw60/X2B2zjCWhAPcvVBlwD10beTXnhm96clEXwugyFYhH/tfmRVY8RN7jIPKSu2nMnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCADq1fK+pEz+9zZAVb4hQSgjTpyDQbDlwk7Q8HRpTY=;
 b=L7UroZqCf2bqUdvDZRvhtUi98ob31sTs28sYFo/uIM0xhqdGVgDoARY4Gr9bPwJ+bwWV9MJ/dqxbF8ugjzcdBxAkqIm69gxGgNLAcgIFYsJRvfzHTXTljX2nfQoVJeHMyWAw9OV1QYBOqkurLZhXJLzWzuMb1mL1C+g1NomdoXM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 23 Jun
 2021 04:30:51 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::181:e51d:a4f7:af62]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::181:e51d:a4f7:af62%6]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 04:30:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YMy2OGwsRzrR5bwD@zn.tnic>
References: <20210602140416.23573-1-brijesh.singh@amd.com> <20210602140416.23573-21-brijesh.singh@amd.com> <YMw4UZn6AujpPSZO@zn.tnic> <15568c80-c9a9-5602-d940-264af87bed98@amd.com> <YMy2OGwsRzrR5bwD@zn.tnic>
Subject: Re: [PATCH Part1 RFC v3 20/22] x86/boot: Add Confidential Computing address to setup_header
From: Michael Roth <michael.roth@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, H. Peter Anvin <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, tony.luck@intel.com, npmccallum@redhat.com
To: Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>
Date: Tue, 22 Jun 2021 23:30:43 -0500
Message-ID: <162442264313.98837.16983159316116149849@amd.com>
User-Agent: alot/0.9
X-Originating-IP: [165.204.78.25]
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.78.25) by SN1PR12CA0075.namprd12.prod.outlook.com (2603:10b6:802:20::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 04:30:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 124b0533-c8ec-4639-25a4-08d935ffae77
X-MS-TrafficTypeDiagnostic: CH2PR12MB4263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<CH2PR12MB426302B7F38E9346091D43C795089@CH2PR12MB4263.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hg7GsMJfIR/aNzNem+KhHkkub1uFS114yOs0+qhVkWbIwUhYQRKIkW9Z136Uj4YVbKuo/mJJVpwoGhOpBuIJLHw7/szL9GfpCBx3NoggdgLcmINpmps6pVRSJxM4++PjvgIWQiyTksVdL6XOFgQv0za1X0D+d/AGI3Z0n1tqKoV0m8sB8mnQQX9QppsUKu3CdrmfHmsxlLPK3AxzV3A65kO9+0+OWhfnFujPbKoHl5E+1vvxOZfECeVfY51dCH0yMvRbb6p0PxBOOCr3trwst6ZgHAMF48mdYJu/s3lUWF/F7TxUZrdOAdwkFwhc5iTcfs2c8xCp+3oMSKnNUe4KPHXm9BoCrOuBVermm48ds0wEiw/gN7rp2HxoQIRkH11XYcm3Xu/Sb+Y2xrAInnO9mGyU3GmD0cKCedcKK7FxEpDcidD3dRjSsiqq7g+eqONDp6xwTj0J29JsD8Sl4+4v42DZOoMPYED05TAI0T1Lvu/yN0eH8a922UYoZFa2gas4LrWwUcECOv5FR+n7ByJSnHrGQk4jSgAFnFEaBqkV4yMvE+QlKubI9S5IDAz8RB1Fyo0ODPd5Jrj5SlGj8tn+ntzqO2ZL/TvGj68NJ3OAofdolgeBS92GSvJKYxAkBfUEu121ngS4EHxRZaRJNg2x4SFaKwXLbwfhSizWjwifeCCzA4XeZ3R6KFPMFhoAcZdx/Yy5c0z2vpHSsSn857kLkZnTzXTUnYOKsEdJNsp3w5upXg7UVQzkP++mdMROeCOM9aGOjRbcMRj5/bUvBSYmUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(38350700002)(38100700002)(44832011)(54906003)(110136005)(36756003)(86362001)(8936002)(16526019)(956004)(2616005)(316002)(26005)(2906002)(6496006)(52116002)(8676002)(186003)(6666004)(6486002)(66556008)(83380400001)(478600001)(45080400002)(7416002)(66476007)(66946007)(4326008)(966005)(6636002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2FsVi9RRHIrUDJ6c1N6cUxNNEtuZjNqNnJFTG5VRmdZbVpOYXU2c3daMGxH?=
 =?utf-8?B?WmVrR084elpWeWdoeUs5NUo5WUxCVmNxVktCVzR1L3ZIZGU2aXA1T1RtNWFa?=
 =?utf-8?B?M2k4Yk5FT09lK2N6UWNQbWc1UDdIRyt4Z2FkQVB4cG01Y0dwQWEzUDlxbUlM?=
 =?utf-8?B?TXpyZ25QWVJLTEpsQlZ4SDFhT3h2b2diTlVhY2doUmZnZTgzeVFxZnBtNU82?=
 =?utf-8?B?bUp6dGRkd29yekRVZkZCdEV3dFpPbVdXejJjWSt5V2ltd1oyUGdiQmh6dW1M?=
 =?utf-8?B?dHpwemkrKzR0NjRWQ3V0UTZZOG1TY0U2RGFXcHF6SzJhUkxZS1lPbC9TU2Rq?=
 =?utf-8?B?VnEvcXc0UjNPZElxY1BNR1BlYXl1Z0VtTlZlUWd3VFVsNTF1ZzZrZVA3cnVY?=
 =?utf-8?B?VWFpUnBYWVY0c2hMNVpZeHg1NXR1SXZsb28zVUxXRDRhT0tWVDJNWi9HSXNv?=
 =?utf-8?B?VUIvVDdTcXRYNm1Md0RYR0RTVjlDR1U3Mk5nOHhMUnp0bWtPTGN5YjZPU3p2?=
 =?utf-8?B?MjhTbGg3ZXgxUjdJTXZ2VnQxMUI4OFhOVzFqNU5SSHdXV0xhOWNITFJmRTcx?=
 =?utf-8?B?TGdicWJJTjdvNXlNbmxQWlgvZnJzNUl4NTBoK3VIMVFkWHN6Sk9IVGxoZnho?=
 =?utf-8?B?V1ZubjJ1aDVnU1p6OUdWYm9RY2s2YXFCZ1JUajBNQ0JiOWRDYTJTekZoZkJl?=
 =?utf-8?B?WlVGakt4TUVoRlo1M0Z4ZjhXR0d5SjQzV0Q0d01ONTZJK0xDQjB0K0htTDR1?=
 =?utf-8?B?a293NEZ3YmsyZnh1U1BESDYzRU1aS2xDcXhWWFVyTXoySGlWNGRjTFVjMkFL?=
 =?utf-8?B?b2ZqSVdzSDFXd0NudnFGd3IzSkxuMkVSRFpIeEFYVHNBTVFaSFNyby9nUUly?=
 =?utf-8?B?ODVVVGdIUjU3U3VOdjR4R0pYTFZWaUd2UVFxREZWcmNydW44dCs5WVNHc0l0?=
 =?utf-8?B?YVVZaUV0YlViNEx5RzJnMkVVNVpZRmpJYW5rcGRVbU9LODJEa1ZSbForZi9W?=
 =?utf-8?B?TDJDZUltYW9MQ2liV240UW96bkNsY3l5WU8zcVpnZWpRKzJ4SjUrR2Fnem51?=
 =?utf-8?B?WGtHNGxQVm0rbzJKSGtITGZuSkRQd29wUGRQOVRBeU5GS0c2WHFvZmxMQjdn?=
 =?utf-8?B?WFZZOVIrWmY4WnFvTTk4TmlMV2QxZmYvTGhCOGVMN1RmbHZpb1IwNm5EYnpR?=
 =?utf-8?B?OFk4Vnp4a29qQW9EU0JKbDF5VGtkWGJqRUNvVnUxdTBJeXBIVVB5dXg0ZlI1?=
 =?utf-8?B?d3dORi9CTnhKcXY5NlpTTVc3MDgxK3BOcWE5d05mblNWWG5rRWVSNWNnKzU2?=
 =?utf-8?B?OXJvK3g5SnlVcHZWSWduc1h3VlhnUTY3RWhWVFNnYlpONWNXU1hyZmo5andM?=
 =?utf-8?B?SEY3QWZtNlVGOGI4MWNsQ3J5TmEva0hzWEJlQ0ZYdjZtenJ3Y2RDdFNlWDVZ?=
 =?utf-8?B?YS9wVmpaZTE4b25xMkV3YW5BMDFCZFBmV2Q4VXp5SlRMYk5CWFIyZEoyaUJi?=
 =?utf-8?B?aGJhSk5jQjBjSWVtMGl0QWRqU2tHa0tOakhYT3d2WFVoNjlVTjZGWVdjazVO?=
 =?utf-8?B?TzF2TG41S0R4WUVOVlhLanJhVldQTHVFWElLd20xZ1IrbnBRMEhwY0cwUTRV?=
 =?utf-8?B?MWhYZ2pYRUNhTFN1aDk0S3gyR2lhbnN2eTVVbXNzb2RqYjR0QldzcE1zWnRY?=
 =?utf-8?B?dEk5Z0ZETHlsaVIrREZ6N3VIQkd1WnVTKzRFY0hjZWFUSDBKUFVsL3VpZklE?=
 =?utf-8?Q?aOPIy5mdla3IXBUZ6STi5t5NS+zGu3vT/z5KAY1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124b0533-c8ec-4639-25a4-08d935ffae77
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 04:30:51.3077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9gAmbP7/q72wCIajQoCayw9nb4/cbJ+gADp+P9Xnu4EdRheg7SkOnjbkONmRzHQi7YPN0zv7fwu39LEhpXAuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

Quoting Borislav Petkov (2021-06-18 10:05:28)
> On Fri, Jun 18, 2021 at 08:57:12AM -0500, Brijesh Singh wrote:
> > Don't have any strong reason to keep it separate, I can define a new
> > type and use the setup_data to pass this information.
>=20
> setup_data is exactly for use cases like that - pass a bunch of data
> to the kernel. So there's no need for a separate thing. Also see that
> kernel_info thing which got added recently for read_only data.

Hi Boris,

There's one side-effect to this change WRT the CPUID page (which I think
we're hoping to include in RFC v4).

With CPUID page we need to access it very early in boot, for both
boot/compressed kernel, and the uncompressed kernel. At first this was
implemented by moving the early EFI table parsing code from
arch/x86/kernel/boot/compressed/acpi.c into a little library to handle earl=
y
EFI table parsing to fetch the Confidential Computing blob to get the CPUID
page address.

This was a bit messy since we needed to share that library between
boot/compressed and uncompressed, and at that early stage things like
fixup_pointer() are needed in some places, else even basic things like
accessing EFI64_LOADER_SIGNATURE and various EFI helper functions could cra=
sh
in uncompressed otherwise, so the library code needed to be fixed up
accordingly.

To simplify things we ended up simply keeping the early EFI table parsing i=
n
boot/compressed, and then having boot/compressed initialize
setup_data.cc_blob_address so that the uncompressed kernel could access it
from there (acpi does something similar with rdsp address).

Now that we're moving it to setup_data, this becomes a bit more awkward,
since we need to reserve memory in boot/compressed to store the setup_data
entry, then add it to the linked list to pass along to uncompressed kernel.
In turn that also means we need to add an identity mapping for this in
ident_map_64.c, so I'm not sure that's the best approach.

So just trying to pin what the best approach is:

a) move cc_blob to setup_data, and do the above-described to pass
   cc_blob_address from boot/compressed to uncompressed to avoid early
   EFI parsing in uncompressed
b) move cc_blob to setup_data, and do the EFI table parsing in both
   boot/compressed. leave setup_data allocation/init for BIOS/bootloader
c) keep storing cc_blob_address in setup_header.cc_blob_address
d) something else?

Thanks!

-Mike

>=20
> Thx.
>=20
> --=20
> Regards/Gruss,
>     Boris.
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpeopl=
e.kernel.org%2Ftglx%2Fnotes-about-netiquette&amp;data=3D04%7C01%7CMichael.R=
oth%40amd.com%7Cc0b20041125441de743508d9326a8e96%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637596255567306700%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dni=
netMMQX9bQIgjIshN877BQ5xv2R7h%2FZulHd%2B8TI3c%3D&amp;reserved=3D0
