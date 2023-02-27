Received: from BN3PR00CU001-vft-obe.outbound.protection.outlook.com (mail-eastus2azon11020021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245582F3A
	for <linux-coco@lists.linux.dev>; Mon, 27 Feb 2023 17:03:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6zSsTbBHfFiKPUKwi2F+gleQRtkg+CTjz5srpBreNNjgrOqbzx9rith9S8AqrFfHdGBBWKFLjNAmxKCm4RJ24JzWskA5q2hLoRSusyh6lpDSMgN4RnIgszCcl0OVniWO9K+NZnOyIMSGwB9hx17pX9ZMVlRCFmJ+PAV/Ox9CsOp8T5IEfqyIwvYG3lpVufZgHcsKL3p7mppoYu79mATlRTFtA2duroj5PZBPnBqY/usbXRA/nA5Gx9SO3ORklpWZaUALIOPGY4itAL98l489mA6w94pUQ3ol90z5E8zwVUiQUE74LW3T9v9LOGQNrAwKD8YCbLKyhNHps0v7d0qdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjfsboBBKJRwPl+ebuPcETLZpUbf4khdqcoD+Wxr1HI=;
 b=aKUJHcRnc9MfhUnh++V2c0tZSPm6c2kuZx+OaTKuWDpAire23L87HXgtQe1h/n8BjDV6t2MF/7kID0kVbPXGFBNGN/iuMXtOZsWrT68LOREAsfJphnVu7Ul6eY6vcZm5queST8wYtjjAAwiLKc5hehdewJxi+AHQBMUahE1APM15lGNep615FC9VYcu/tbaaO2zZmUPWb6zveGtYxkV5QfKIUKebDWt0a8Bwu4gB7v04n5B4k0f940xHQyFaaNnDE4XT4iSDq2aK9SdwlyTtIEzhTRz1Ar+bT+TGbR1cxl+9gGS3yW96l/XIHwqzLKpkC7x157790l2giybhFp6UKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjfsboBBKJRwPl+ebuPcETLZpUbf4khdqcoD+Wxr1HI=;
 b=QdP2Z4p1dQomBwCBAx8AC9mm9lNd7cPlyOZM5k+YUVzb8QlAKZWo8lFh5CKyBY4KpEQqjQ1nVsZ1EWfdH2IuIjiHjbRLrLzMKvT2EBZUol/ENOP03aZcIo+THEBBESElNt5maj+jatkABYfQGptyt8kbmvpaz6CEiEUpzMDyWkU=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by SA0PR21MB1930.namprd21.prod.outlook.com (2603:10b6:806:ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.4; Mon, 27 Feb
 2023 17:03:07 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::424e:dbf5:798e:581b]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::424e:dbf5:798e:581b%3]) with mapi id 15.20.6178.001; Mon, 27 Feb 2023
 17:03:07 +0000
From: Jon Lange <jlange@microsoft.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	<amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Thread-Index: AQHZQSLWNOs+AcbsCUmHp01ByE1c6q7Z/5UAgAQy9gCAAE+HgIAAwbWAgAPSSoA=
Date: Mon, 27 Feb 2023 17:03:07 +0000
Message-ID:
 <MN0PR21MB30720428EC5692B2E9BE29FACAAF9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de> <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
 <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y/mrpV/pPxUontKF@suse.de>
In-Reply-To: <Y/mrpV/pPxUontKF@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f5941be8-e595-498f-958c-041e04e7e956;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-02-27T16:54:34Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|SA0PR21MB1930:EE_
x-ms-office365-filtering-correlation-id: 9ef44067-9442-4a91-6005-08db18e47f6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /LIp9tI1vjhnGIXeausJ16rL4XNRpY9zsFzPYXavjWYXCsCUE8n7ivygP05IsrJ4hFqSBeH5BNq8IZhjIkHDbEHx5jT583kMz9AmNOW22EhwmXr1/+umqzScbA89A5xmxKQXnhmvAWSHC0OA43tqc7GqUcgag+iOYhTgYn2cal4ZqafQWO80lQA7bPegIWaiwjS/JsmjPElcT62Dm1NOPRxvR786CTfF/T7ZMUjd41H4RqlCChx2rHNYEvifdixWglyx3e762iFG6h8XbWF6a89TfdhsSq/qQ6rvwHHTd/xOmzlBY4o0o5WRr1I6z/rmfRaKkbGmPiS2Hjo6saTfxqd7kQjdFf1gXhft3VTJD9GyTI+DkhC5Ia3PIhgZo9Agd4he90nQbijpPsKx0zxXk5G7kvAlxpvfmp1feIbuS37gLf9NY6sOHw3WSU65wV1PlMu5TXPubg657J1nwtJ5z9HwwU0uNJFbodA5bV40LIsarSc/MfbVl27OcQ2L/YbeqISSCfP7BuP06k/S8dSr/r+tYfFjbWam3l0F3JIANh680MDeRNqJDgV5HNS6OSUUOmTlRRHffbgkNuQWLPzBv2HXNc9FekRu3f3ug+7+61kC23vTahtB66004BTPRBSE3TidFLOZ/mqmRqU7urGnTc4nk7S84eamoyqqel5XLiwjbHOlaNwszPIjtfd+R7KkqmuVIFfsnQeiFvrijnYgNm5SZC9C1Wob8V3vq4jzC6lhUaX4kBOFI4rFcb52B/ee
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199018)(33656002)(54906003)(86362001)(2906002)(9686003)(64756008)(71200400001)(5660300002)(66946007)(4326008)(66476007)(66556008)(6916009)(8936002)(8676002)(76116006)(41300700001)(66446008)(6506007)(478600001)(10290500003)(66574015)(186003)(7696005)(55016003)(38100700002)(82960400001)(82950400001)(52536014)(122000001)(83380400001)(316002)(8990500004)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iPtMtSFhP0tLpkCUIgXZsFOBOJj7w2mWKrdfn8WHoHlWpDtGaaeYyU75QM?=
 =?iso-8859-1?Q?J8ZQSVwzXF4GRajWLhUSsZ+1IX82raIpoD8N4fYxWP1oeq3Klb0KaOH4i4?=
 =?iso-8859-1?Q?RhCfRZLVhqfO8VkHjYGfkzTprsoOUaGvyYqtyqU6vVMFv9f7zQjG0024vN?=
 =?iso-8859-1?Q?mBXH3R3pz1KDOgapAFdJfJnwSUBlOZC08nzyGLp5crAqUiz9Y5Qd1D1q3A?=
 =?iso-8859-1?Q?HKXqDgqhCXhAdA7uFN4g4t9Dw2oh6SiJ0XUCnIRVkTRGQD9Sm0afH1bXug?=
 =?iso-8859-1?Q?KXIP+bukWdPjaZyDZ/Q9nyl5fW5RB82nkVfaYPW7zb6Z8AE6VEESTWMW52?=
 =?iso-8859-1?Q?P8i1rptzAOntI/A1ObcwcY3QmLfqT3wta7PZ91h43uqZ8M8CcxvB3ghhsT?=
 =?iso-8859-1?Q?apXMxgtevTG3oxebbKr7Om2eQiVB3iLGtHQCWKjujdVjodjAro3hY/MHAc?=
 =?iso-8859-1?Q?tU18GxtDg0/tBwh1NoV06ql1NRi1KzNNwxj7DSwMU4B2JAGhgvv0f9iyz9?=
 =?iso-8859-1?Q?lCjo7nsBlXVEDSdOkzbgh8jaRJcIQydkeXAkRXvwsZj4J3QsAS9zBZxxrZ?=
 =?iso-8859-1?Q?VrM50Et3dYENon6oAs983TTnahisnw/BwddyixFAOPigOd6KmMxcIBGVKI?=
 =?iso-8859-1?Q?r8r3jViD4EwekCKSZGdpMowL/nEZVNs0lO0sqSYxgQwcOscR9AzKp8B0Yp?=
 =?iso-8859-1?Q?uK2lHimn1GeX7x/fXXHjp0gvd+sC1c6ELKMupZhASNPuhKuNBazcy51dqp?=
 =?iso-8859-1?Q?tDqvDZqCANBRUWVwE+BhW3WIeFFOJTTb27skWhi8Ar+ocpPyO2E4vArKUN?=
 =?iso-8859-1?Q?bhfie/+1qJmGv0QZiqJquXchD2alcKZPrhVkQWTdtH6WDqR9kqdaWXwwab?=
 =?iso-8859-1?Q?NuszfnycovTTFEkcgh0XSp/eBp97wpnH6a8dPa8D8Cl+Sw0k5Pv4QtkmqG?=
 =?iso-8859-1?Q?vGfUm4XOgNfthVb4LA20u2qZsH5aUYyEJvrvnSwGQQGK1l5ul+tRqzIXkS?=
 =?iso-8859-1?Q?BFnzr3JV4E9mKYi5XskLhRYLdPQ1E7E7WagOPdLU8WrBoPXeAhxAnLkrBK?=
 =?iso-8859-1?Q?QuCs7cvXAwobssvA5QEAKEb94dlZ5NzRL4azJzEfstUKoiuNsIDJxTH+QS?=
 =?iso-8859-1?Q?Oe2bOkvmgla8pvJxE1N9zCMjehwTC2ftbc75xdszAMQfsdVflW7+KQMG8B?=
 =?iso-8859-1?Q?2oS1f+tRZbtf9fvculvF/KIxulUprS7CEa595HxxEYltdHCJi8fRlBKpsB?=
 =?iso-8859-1?Q?xwvnhZddtDw96YycT27RAveqmvpZgjzkUU0QR6NtlaveGzwEUxdYP7dDVt?=
 =?iso-8859-1?Q?uaXDeKTsV9NSkAGfWgWbzqymvU+yD3MK77HLhY7zLiXLnklctOmoqPREoR?=
 =?iso-8859-1?Q?OvoP7Zp8gSMU/RdoBHJcvd8l1iR/ZwviXkN+zUwgqLRF8nTywfERG47y6s?=
 =?iso-8859-1?Q?EFv3lSDT1ju0Lrv8IhmWzqpZsDZ0+7mmqTrJg4vLY6cDx2FJlhRHwapSGA?=
 =?iso-8859-1?Q?+oay2F/x3spar/gAa/LpTZduMGXuM47Edyctg5PZ7x47+0H45K9ntTAZs7?=
 =?iso-8859-1?Q?s3NdJCpayLc0aTqGD8pOrZ1v7qPGwlfHLBcNLSyRVACRVEqdZ5i9pD/per?=
 =?iso-8859-1?Q?DxJaroe80i5x84UBJ3R3CzMNv1XM3+vOYKYf/M9PGKoNXs9GVzmYDbPtHK?=
 =?iso-8859-1?Q?4tFL3xqU3B4YsRM1bPxMz+PsTMl905nVCdQhiYVJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef44067-9442-4a91-6005-08db18e47f6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:03:07.2254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2JTi3MoEiV+mX/x8Z1EWouX9cwkhB6AqiPkKnw4u/NgPp3WXZaJwKyjcfSqyg0Z1/bzrA73tmnuvECprFHXPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR21MB1930

-----Original Message-----
From: J=F6rg R=F6del <jroedel@suse.de>=20
Sent: Friday, February 24, 2023 10:33 PM

> On Fri, Feb 24, 2023 at 07:02:21PM +0000, Jon Lange wrote:
>> If the target VMSA is running, then the attempt by the SVSM to access
>> it will generate #NPF since the RMP entry for the running VMSA is
>> modified to a locked state while the VMSA is running.  This means that
>> if the SVSM observes that the instruction that clears EFER.SVME
>> retires, then it must have succeeded, and the next time the VMSA is
>> selected to run, it will fail with a non-canonical VM state.

> Yes, that #NPF happening is what Tom told me too. That is a bit
> unfortunate, though, since that #NPF gives control to the HV and we
> don't have a way to handle the situation within the SVSM. Best case is
> that the HV kills the VM when this happens, worst case is that it loops
> over that #NPF as long as the VMSA is running.

It's true that the SVSM will not know if it is under attack in these circum=
stances.  However, delivery of the #NPF prevents the SVSM from making any f=
orward progress, which is equivalent to a denial of service.

My opinion has always been that defining graceful behavior in the face of a=
 malicious VMM is relatively unimportant as long as it is impossible for th=
e VM to proceed in violation of any architectural assumptions that it might=
 be making.  That should certainly be guaranteed here, as the SVSM is guara=
nteed to receive positive proof that a higher VMPL is not executing and can=
not execute further until it approves, so it should be insulated from surpr=
ises.

> In any case the SVSM will not _know_ that the VMSA was busy and can not
> return the FAIL_INUSE error to the higher VMPL. We can partially work
> around that by manually tracking the busy state within the SVSM. But
> that doesn't protect from a malicious HV which randomly executes VMSAs.

Is there a reason a failure code is useful instead of just blocking (or spi=
nning) in the SVSM until execution can complete successfully?  This situati=
on can only arise in the face of a malicious VMM, and such blocking is no d=
ifferent than the (malicious) VMM choosing not to schedule the VM at all.  =
Is there something uniquely useful the higher VMPL would achieve from obser=
ving a failure code instead of just waiting for completion?

-Jon
