Received: from na01-obe.outbound.protection.outlook.com (mail-centralusazon11021027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E20C8B20
	for <linux-coco@lists.linux.dev>; Thu, 22 Sep 2022 22:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwjSla7tcAveueyPzR9JSoqHxidh0DcCnKCNM2IA69AE/J3y3O71a1O2waqRnEF79uWZ4c7S8mHaKhT2AcNy7/7y/5p5C4V0s+vqRgij2por9LWyyt9coWo9yFRuZIY7YCSHPcXi4dJkHi+9eXwJ/rI9CEfC68GOvEp9MAlmhkhKh/gbUqfIlLia5WYGy64U1ZEmyksqSTrqvlD2GDuEH9Kp+058BRP1gK53VT/H06KnmxgwHBARabDFVeKHRWyA29r1UhKg0gGhW0wwHVq96Z4rdcio2d5rBGslh0c0U7Pc3Bxqt0bjB4d9gi7+tOJnMAEnNceuLM1daxAYkKnB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDuIgY9HHWnD4736JYwi3AEtE/Jw55e0nRy3TssolDg=;
 b=mUKftgsdjsZEw2xvyV9/jthsS69y9b+XWUXH/mYbuWAXp3sAviPUH+BzqngnYIWGOivTHIhJwvztey1fzYTfcuoZ47EDpMXhyA24Cgx4ePzZg6YwpQ3oBGPtzJF0huSF8d+oYuGKTiDleHJisK3ekp1aKukPUUGI4XKg6iFfNpA/REBA22YRSgN55z9bXGvmHRKwrGmTbbOjevYAhumaoSlGbPkz4tvUUasSR8Ow9hLOBKLJOJZF4q6hY4HXW8VnVBeh8N/GZWMW+RaUbn0YMTuA4hhWTFXR9agq01YgqatU3Ofel4FAMC7O0smL5mZB0yISfcaQwSl4pkXJkZ2q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDuIgY9HHWnD4736JYwi3AEtE/Jw55e0nRy3TssolDg=;
 b=a0Nue3olEhKCcggYdmJC37qILm+S4O04Fcljo3647I9Pd1+ObMVkcuVpHozJ2nvMsWHIkXXcx+3sD0w+j9Bo1576kBNdj15CYOK4AnvClm8dYLSGeEmbacgcUeuqg9wn4A1DvqLB2XkkGU8khjHSntsJru9uf12WVpDhkEznLW0=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by DM4PR21MB3250.namprd21.prod.outlook.com (2603:10b6:8:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.9; Thu, 22 Sep
 2022 22:01:44 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::5ec0:aab1:d7d1:c413]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::5ec0:aab1:d7d1:c413%7]) with mapi id 15.20.5676.009; Thu, 22 Sep 2022
 22:01:44 +0000
From: Jon Lange <jlange@microsoft.com>
To: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
	Dov Murik <dovmurik@linux.ibm.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	=?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: Secure vTPMs for confidential VMs
Thread-Topic: [EXTERNAL] Re: Secure vTPMs for confidential VMs
Thread-Index: AQHYzZc5UqPtCi5cUEut//wveD67263qHf0AgAHXZACAAArwAA==
Date: Thu, 22 Sep 2022 22:01:43 +0000
Message-ID:
 <MN0PR21MB30723DB529E05787DE38F3F6CA4E9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
 <YyrQGXO34ZRxSbgl@suse.de> <fbb87137-1b54-29e7-b1f4-a8b5c2f968a5@amd.com>
 <0b3558a6-e5a5-a45e-c5c0-cc59ebfe167d@linux.ibm.com>
In-Reply-To: <0b3558a6-e5a5-a45e-c5c0-cc59ebfe167d@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-09-22T21:53:29Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=b27a8584-1f17-46dd-9a30-7f497e617664;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|DM4PR21MB3250:EE_
x-ms-office365-filtering-correlation-id: 3bcf3309-eb7e-416a-d85a-08da9ce6095b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dk6KKDMjA0YwjTUEC1hndK8YN5Wnq9orA2DMFUFTgNVxrDGxhFsRgPmLWDHE1ivH0YGz2OTx3C0hHfATuOq8exBVibhxTdBKpquErFZ6Nz8SHsIhTt7TsK4DuGdXuronTp3cJqBTLNNZvai5HhLnDEbGJNNTyzW67K0T4KC5/nbjbzLtcAYej8lhszwkEVU2wfGTnL8n3o8mC7XrCy7idgLpzR20CzXZKjUb7e9okj+CqQGhPF9NhTgyx4+tyiEneR8FRRDueRzCQX0eJ6sti6fsgvO80JlhTk9noarVN5UzWV1SR1TFHhU51UKKg22RSwOTAzYE+0GkBQFhqq3Z2c+hJfQlPXyAYkG4Hal9DcBeRMBFzKrePECovMIrAJc72MqksQeYRKi5/a4hV0AppjjPCvLFRl8euLIwhAqGaVN/v63cfi0oxvOZ62whhpm893miDCJ9g+bOsgPEO+n69YATOhV0dO+uxh3EL4vGLrupevYpHrNKFlD8nnU2r/BRB6A97pFsmIgD0/LREM93d7A1/kCii/StftmuFquo9K4utLNjCyjtA9Iwslg2+Ql7CgmyWxOUjbB3CtogjsJBKVr8gQjwpN2j3f2YLch6Dwj6jI/Bof4V/MmxIaxeND84iMSvN4Leu8Fc3vmR7F+vNDvA3Z5t7pK9Gx/UgkAivfSMffFmYtnfXJNdXfXUeDDSH63MWXwcyOK2Cz8XeRo0501w4uHtO3ezpnhR6c/TSgdvHpXc/u7Qts2CYKHMgKo08p9kyeOSerFnm5kjt2pU4VqpXO60shJp1OslRu2J4Zi2nnXpVa/Wu2KROXvvfhE1ubUlriBI46tbLCptBcacOYTDHfj365tApZvtqnSyukU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(53546011)(9686003)(6506007)(7696005)(33656002)(38100700002)(76116006)(122000001)(38070700005)(8676002)(110136005)(10290500003)(316002)(66476007)(4326008)(66946007)(66556008)(64756008)(66446008)(86362001)(82960400001)(82950400001)(66574015)(186003)(966005)(41300700001)(71200400001)(83380400001)(478600001)(2906002)(55016003)(8936002)(8990500004)(52536014)(54906003)(5660300002)(18980400005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0guFliWAVsozvHpLmnSayHSnnDT22OZ40dYfhk9flO0U3TXirKZ+PMgQx9?=
 =?iso-8859-1?Q?kr1JfSzF+xoRLm4K/lbcVZhnWqgDvmhnf1UKBdmEFUpcoaptbGUPJDraaK?=
 =?iso-8859-1?Q?MkrFGwO6RsZKTMrVUJim9vQUnhoCiZYBizlya5LZqUVGLua7TimS9CSO7k?=
 =?iso-8859-1?Q?0xEpWl7AaqAP6PIhZ9GGNoVTRu7ffyhrf/s0K/h8mv2FzQEL69bc/GwZq3?=
 =?iso-8859-1?Q?fn/k9yfnHTXp7GhVADTd5Lte5OsWM4P7NUZfq1kNYF9lpqi3MOJvruGl4Z?=
 =?iso-8859-1?Q?x/rKxqtIqxC50Asepeocri4PacPOHKsA1KJSjFYLn4OP5ugcxlXJhpcJia?=
 =?iso-8859-1?Q?U5J+Y9xqbvRIlPVDYeLeSzKAHfrQqAXWLGTB1le2FHwDDnLvSyQSt5SSMq?=
 =?iso-8859-1?Q?BgFAfBmhViafxx8hqq8T4JQuSrM5u/v0L5YcZwW3Z2d/LTlyfX2lnyJ8Gd?=
 =?iso-8859-1?Q?98kMljQE7CIDlOEE680dsuFpbHjwyWcXwNU+e0qVfDDztp8b7WeZFxB4hK?=
 =?iso-8859-1?Q?A01YgXCMEpzYyFtZaNgBcwh3huRPRfn+NNb1pS5BNEmYskJE9gbM/SBVDB?=
 =?iso-8859-1?Q?WZPV7t1HVaOnOoQbWFPjqWQ64Rzemy+W1Y8bdvN2KAMMR6QtVgq24LLBPg?=
 =?iso-8859-1?Q?91qo4q5l6PT0ovh6fY01FrCEMqdqL+eUlspzjbL24uceRqq8YoXDDTnx9T?=
 =?iso-8859-1?Q?6HTOxIXZZRTMiUzpG3C+SNNZC6MEDH3Ljv/6qb+PU7NjotfQZGyhurAxfN?=
 =?iso-8859-1?Q?w+1nlucxpoaaRk/5keexbe3vDLSLC8Dx/LsZt21NoYYbDe06dnKiifmrFI?=
 =?iso-8859-1?Q?mJqLqHIvU6LaIhixM32VebBaPboica/kXLs7PVGuDd5gJf/KSFTyuHHYZU?=
 =?iso-8859-1?Q?/Aa4HB80z+EwPmL3EUUG4NT0GVPbdpqAeF5byRIphvaC/EbShR9lSdXxUB?=
 =?iso-8859-1?Q?ov9XlIpWuQ0Mi80zNWaQjyNwAhGW4O7AsJyDMJZF2OBO/N73L1AHn4Z6hH?=
 =?iso-8859-1?Q?re8twJTkvbGtbAp1lR6WjHItGH1x9Nsnzo7m/sY4og4NavQwpvedWYSR6Z?=
 =?iso-8859-1?Q?eNW7TxsAW1Q2rdI391gn/o4sSfa3ymzAwoxj+3kxaMob/uM9yx9wfjMfPf?=
 =?iso-8859-1?Q?mfrjOsycYC8zIYVITABZ1t+u0XTnLFEuWhmIyJRQm3LRy1eTv9ZhDZn1C5?=
 =?iso-8859-1?Q?NVt8VfYRAiVz1l7isy90fCWnFEjUwHDAKGYxHqoOPWc76KdTP5cIY5PJLq?=
 =?iso-8859-1?Q?fZENXupEOSbpKHi2fbXMhdQUWGerNOMZJo5tfCowCfl9fNCeaJ/DcbWh01?=
 =?iso-8859-1?Q?g2Pc/imjy19Elbm1fghykxTOAngr7oV6kiw/f0Qba4mUcY/BvjW2CkqrLm?=
 =?iso-8859-1?Q?AdLhkR+bthMRgKZRa8kDcNzBM6fhmfNzwdGwQBWtq/HgryKSry9bF0q7X0?=
 =?iso-8859-1?Q?6agtWq43Jx+GFTkWVCbQ1HFpCr/dzatqHroTtHKHwn/yzaubXlB5X0XwLF?=
 =?iso-8859-1?Q?LuPnA3uLnRKLpGLUt10VyLyLGYSKYL6ekkeyhdGxnWMn9VA1969iqQWz1p?=
 =?iso-8859-1?Q?I7I0iEJ8cf3InE4i9gGJpdUXj8rK0MBrjDH+l3LtP44WTITCnM/cTDrYye?=
 =?iso-8859-1?Q?vKgZNQvYd4H/xswzC0FSiL9TpnzxGbznaEyrWDJgD8DQHuKSfXJupVoC/U?=
 =?iso-8859-1?Q?auWi9ZUiVzIBYAQ7DPrN9yXDNSJPYFskEsDfeVhg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcf3309-eb7e-416a-d85a-08da9ce6095b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 22:01:43.9147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zAvNPeS8JQzt3TUoWNa+sXb6L5CO3dUpVjyeRDK1dpc5+vwz0KhWt4FDBb2DtQNE97VQdaNRBXdEaquPlUDHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR21MB3250

I have to believe that any guest-side implementation can only be successful=
 if it does not impose requirements on the hosting environment.  I cannot i=
magine that hosts in general would be willing to define an additional vCPU =
context solely for the sake of executing vTPM logic.  The whole point of th=
e SVSM interface definition is to permit a variety of SVSM implementations =
that can be compatible with a single guest OS image that works everywhere. =
 Imposing hosting requirements would appear to deviate from that goal.

Purely unenlightened guests surely will run into SNP complications in many =
places other than vTPM handling.  Isn't it reasonable to expect that any gu=
est that knows enough to make SVSM calls is also going to implement a #VC h=
andler?  I agree that instruction emulation in a #VC handler is cumbersome,=
 but it is much simpler to do it from within the same VMPL and addressing c=
ontext than having to do it across VMPLs.  If the TPM MMIO range were marke=
d as not-PVALIDATEd then #VC delivery on accesses would be guaranteed.  Con=
trast that with VMPL-permission-restricted, where the behavior is dependent=
 on what the host wants to do (which is outside of the SVSM contract anyway=
).

Emulation in a #VC handler may be undesirable for other reasons, so an enti=
rely new, enlightened vTPM contract may be unavoidable (such as the interce=
pt handling cost concern that was raised earlier), but if a new contract is=
 the only path forward, then it seems like designing a specialized contract=
 would be far preferable to hopping across vCPU contexts.

-Jon

-----Original Message-----
From: AMD-SEV-SNP <amd-sev-snp-bounces+jlange=3Dmicrosoft.com@lists.suse.co=
m> On Behalf Of Tobin Feldman-Fitzthum
Sent: Thursday, September 22, 2022 2:14 PM
To: Tom Lendacky <thomas.lendacky@amd.com>; J=F6rg R=F6del <jroedel@suse.de=
>; Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev; Daniel P. Berrang=E9 <berrange@redhat.com>;=
 amd-sev-snp@lists.suse.com
Subject: [EXTERNAL] Re: Secure vTPMs for confidential VMs

[You don't often get email from tobin@linux.ibm.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]

On 9/21/22 1:07 PM, Tom Lendacky wrote:
> On 9/21/22 03:49, J=F6rg R=F6del wrote:
>>
>> The current plan is to have VMPL1 talk to the VMPL0 vTPM via=20
>> standardised SVSM commands. This requires new TPM drivers for all=20
>> VMPL1 components. At least unless someone comes up with a better idea=20
>> :)
>
> This is probably the best approach. We will have to modify the kernel=20
> no matter what, either recognize the MMIO range being accessed from=20
> within the #VC handler (and then parse the instruction, etc.) or=20
> modify/create a TPM driver that talks to the SVSM (and thus eliminates=20
> the exception path). Either way, an update to the kernel is required.
>
Yeah, supporting unenlightened guests is tricky. We were initially thinking=
 we could use the RMP table to cause an exit on the MMIO writes and have th=
e HV transfer control to VMPL0, but it's fairly complex (and
slow) to figure out what VMPL1 was about to write.

Still, it would be really big if we could do this without diverging from th=
e existing TPM interfaces. So here's a totally orthogonal idea that you mig=
ht not like.

What about adding an additional vCPU to the guest? This extra vCPU would al=
ways run at VMPLO and would simply watch the TPM MMIO region. This vCPU wou=
ld also handle TPM emulation.

I realize this isn't really how AMD have envisioned using VMPL0 (although i=
t could work alongside the current approach), but I think it has some advan=
tages. First, it seems like it would allow us to use the existing interface=
s without adding much extra complexity.

Second, I think it might be more in line with what we could support on othe=
r platforms. Only SEV-SNP has VMPLs. It seems likely that any complex refle=
ction-based approach won't work on other platforms. Having a vTPM VMPL0 vCP=
U on the other hand, would be fairly similar to having a second VM with a s=
hared address space. We might even be able to implement something similar o=
n SEV(-ES) using the so-called mirror VM.

Now there are also some drawbacks, but I'll let you guys point those out.

-Tobin
> I'm not an expert in TPMs, but when using an SVSM enligntened TPM=20
> driver, maybe it becomes possible to even batch up multiple=20
> operations, which would improve overall performance.
>
> We need to start looking at what the interface to the SVSM would look=20
> like. What is required from the SVSM (e.g. attestation report) and how=20
> to provide that to the VMPL1 guest, what is required to be supplied by=20
> the VMPL1 guest to perform the operation, etc.
>
> To that end we can probably start talking about how we want to=20
> advertise support for a vTPM in the SVSM. I imagine it will be a new=20
> protocol with new functions (btw, look for an announcement shortly as=20
> the SVSM draft specification is now available from our website).
>
> Thanks,
> Tom
>
>>
>> Regards,
>>
