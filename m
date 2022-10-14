Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE3C4680
	for <linux-coco@lists.linux.dev>; Fri, 14 Oct 2022 21:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk27Ae5UJB4KQ+QIfArKndkgFoCVmgynJBjy/fSriJnigZUTRUo+672+EGkdJrCYqysB08eEIvvj6riFfh+gFmflDKFVpwkKbsSshKM7o0MJB5OLLR6wu+0jG5YvvuUOwaDTBbRoWqbVUlmgiMGee7YcjcVD9fvyQbRHPri0701n+e+sad/H/2sWzKdXghQjX6APrQ9mOo8cUVcEs7x4qdnv45rOKFsy7NeYRkVGye5bthRSVOkS8AwwR53DZmTOf0IgwtAHbMvmu97oHxQb0Ru9WBE/z4AKl9uz/nKLsdGcQpqLtST1g7YqAHKe8qXhKjCIwe+Q9cOW7Bo2ES8Mfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrOTwxJRElDyoSwn7mgZN2HtBNp5b59FEA0OV6A1FpM=;
 b=hz/joo/qgBG64j4ReiWAbsYZXUuqoUfTf+PJslYa3fw8ROCpb77gL+7GR44EfSaJ5y8Kt9e6qGn4uJfHnTxQQIiETeA4RqYclcs1uyrExLreBA0hUUAbkxMduJs265Q2Rq7Hh8nA3XYwiQQg01SO7CMgyDJMWp+0FmY2t5p+DFJm/Z2HWJBK2P0b+oSDapgf3pf8vlJtsBVbMwAJv5ZHVDVpqtQVHOn5FsiKZXhIfkTQXuedCBK3Lnk6ZeqI11+SozDw6ISwfVZw16/CPnsbjYiNlhFIDXsKxtzO0aRHErHqxmHFEutbYw9c7pXHW8AmBTx79UVFL94+YqkHOt3cfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrOTwxJRElDyoSwn7mgZN2HtBNp5b59FEA0OV6A1FpM=;
 b=AM/uxm9q6tQB4TPXDXOv4y/IJLpNLchV9cghFn9UEyg5ycrrmHBEWsPSCDxKU2LZ9X+BBK/MUi5kQLFFVSoZR6dR19hON7NLPip06WliPtiPSFuZ+95wy/sNHN3cM+cfh0MT8VWGDAQQ7Mz9CtDz6VTyLvBFwdik8TE2UaMZGFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by CH0PR12MB5139.namprd12.prod.outlook.com (2603:10b6:610:be::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 21:46:49 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193%3]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 21:46:49 +0000
Message-ID: <a08770c2-c925-3f1a-cdb0-dc4bab5e42fe@amd.com>
Date: Fri, 14 Oct 2022 16:46:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Stuart Yoder <stuart.yoder@arm.com>, jejb@linux.ibm.com,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
 <3474b28c-2de2-db95-9ecf-6b7c1a59d860@apertussolutions.com>
 <a77148556d530d6b6983d8fb1c6d8bdaf81cb695.camel@linux.ibm.com>
 <b51ea7a5-256e-5138-d956-ddacd4148f9c@apertussolutions.com>
 <ce89a3298963f4fa234e46ae9fe00da66e2ff819.camel@linux.ibm.com>
 <0a0f3b57-13c6-8161-8674-1dbcf3ca9ddc@arm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <0a0f3b57-13c6-8161-8674-1dbcf3ca9ddc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:806:125::18) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|CH0PR12MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 23157456-ffe0-4f91-6e28-08daae2d98dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ITJJnwUCXydD2ycLqnHrw6BlUzyQBOOmxutaSi5JTyfG/IxzIPg6B0ejLanQaNX8isdDx16GFccKQY5z8kfNs6QmC9gwxjYYf8raPtSbk5EdO13p4KnlDqNEBApR4SSlxWGmgbTp4X3bdEWYBUWlmhQcuymGK2os9weZfDJJaVmFhTqhMSLbzmPjqEB6yRDW7NFD7G4oGGBl83TEKuRtPWGmITO3WepJttJROMQIyZSylcQZkFZbKsyEY+umfNmz8uLl8BsaemfT3tstci6x4Scfh71tKTZhg30m91oxkWNuVGPVNfafvdKWyLmHAyXGd24vpc8EAwNwrZntKss888A5LtStWgv+m6OL+hH+aI3Dxt8yJ+DycDzhArKxjt2kkpxtcvXMN8FkBPD0IZyn6OwZ8YsoX/lB1/4UrBnzMNGgDqi23t2FwOYs38Ww2614Z6zRxXZcBgBt6SvSygwEnam8h/4HpQbX3ghde9jPDKANu1xzH8a/JfnLoPbJlZEUJmmPaYwqHppW72vtIz03Xex9JSYPI65U24AZyGSHmr0+3Uw12mOwMrD8dnTeHRWvfWPXnKCA3JD8re+A19H2bXQLbSx0CBeOBRg1qaD8E18g/ebgRGBvvrUSbzvOP18M6iW091CiTHUB1xu725pnjkZkTsqpVJE+zW5AbiGRsiVwV3/pHZ8IciLbjs6ZicrdsId1rIgIgDGViiGsSSLBCx+yC3ckWfCJdIwxuhbu8XG3w+qsb7/20qmppd/QHvRgSIjvBEftawpNl5VhpMeOmY/uwQ1cFyMu/z7lXa4CwMy4/SzuQkG5X+upnX4VpNMQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(86362001)(36756003)(31696002)(31686004)(38100700002)(2906002)(4001150100001)(83380400001)(5660300002)(53546011)(26005)(6512007)(2616005)(186003)(3480700007)(6506007)(6486002)(966005)(316002)(7116003)(478600001)(4326008)(54906003)(110136005)(66946007)(66556008)(66476007)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFpDL0xTRGdYMG5RaEF6M2VLbW9RR2xiU2Y5THBSc054RzNwd3JrV1VsUzRy?=
 =?utf-8?B?MHZjUU1ZbVRlTTNUS0VNVHVZeDNwSVNLcmlGVjlLZ25qVDVKV0hWZ3JPMis1?=
 =?utf-8?B?TFRoOHVTelBBMVd4bDI0YUJMWEM2b21RRjNKZDV0Y3k2YTB1RjcyclU0b3lG?=
 =?utf-8?B?eWp3SEd5bzQ3Y3ArUXZvaG81bCt4SzFqVGZqWTVLaXhUYldyYTY4eHRVQTQx?=
 =?utf-8?B?cDdBa21CYjJRbDI4aUtRdC9wNWxjMGdKdDcvV3Q4eUVwSzc1T1RSRTk4Zita?=
 =?utf-8?B?WHVwNmRoYWJ5NWRac3ZkV0M4TW8xNVZicXpsWHBuemNvZ0ZoVFNFWk4yK1la?=
 =?utf-8?B?WjhRRCt0L0pKNzM1aGhZbEdYMkI4aHlYWE5QWWtxeFN5UlZ6NFl2cGdlVnVL?=
 =?utf-8?B?b3FvU0hDQmhWYVNmRXRxcmlQTlJFdHpNL2lRQys5U3h0VFYxMnFUVDk0K0xh?=
 =?utf-8?B?MWh2N1d1VE03UEJXamdiSCtmUERxekhCb0ZnZ2xMcjhWdlNGTHkzV3VGUHpk?=
 =?utf-8?B?dHZWWGZ5emlnMXBOVDVjbXlOUE5qNmYzWHRuM25vNTNVQ21PakoxZXZGVmEr?=
 =?utf-8?B?K0ZzZU0xV25Xbi90RzJhTWdZdEdRMVdtdHkrYmRoWS9LMHl3Ui84Skh2RUI2?=
 =?utf-8?B?SFpDdjczbjFKQmI4K2pjVlJKbDNlRTQzbEh2UjlFdW1UVjNVU2xFaFZGV2RE?=
 =?utf-8?B?Z1FlZlE2RHlpQ0RqSysyanZrYjV6d3pBMmMxSS9VOGJQQ3pzZ1pTN2hNOEpG?=
 =?utf-8?B?Vm00c2pSUWRJRnVQV29mRjQvYTBCNEVnNlRSTlhDaitLekZ2bWxsL052NmEy?=
 =?utf-8?B?Kzdld3EzQkc2TmlQR3hSL3c4SXd5RHNCNDc1VWwwOVlKTHpablJ5aTllcW8y?=
 =?utf-8?B?MXVJc0lpVERyK2NnT3NaMEpvd095TEtzS0k0ZzVaTU84Ym5QaDQ1TDFOZGJl?=
 =?utf-8?B?MEx6YkNXVVNjeHJUTUlJTkJUUGJYZ0ZiZXR2Ni8xQXhoTkpLK0tiZ1F6ZlVy?=
 =?utf-8?B?RElkaEpwUUV0V1pQUUpEMFc5RUE2UUh4YTYvTnpDNEdLbzREdytSbU5HN2Vx?=
 =?utf-8?B?TnF1LzVyUUNvOXdJdUFaMXpCS1UxbVM5anpLSzNaUU0xL0dCVitvb2JKYm03?=
 =?utf-8?B?WUNIMFFDQXM5eWZZUmd2OUQxTHZZZlJqckwwZEY2bytVanNsL0ZaWHgrSXZG?=
 =?utf-8?B?by9nRXlEY3lMaVBTekNvSGJPR1JjaHBiM091V2V4c1lmY00wamhTSW9uM3cv?=
 =?utf-8?B?UEdrVHhGWGcxcTl3MWRXa1ZScXlzaGxGZDA0dWRBaUpLSHNjZGx1TmY4cTEx?=
 =?utf-8?B?c1V6QXdzMHA2TWpRNmZ2eDN2am5OY3dmRkgzZmI1eWFKazZSQ3JlcWd1WFZo?=
 =?utf-8?B?QkRnOGhxSDljN2dJakhFQU9uTTNzN1YvaXgxYWk0YUxnaE1CRTlsL1RWTkFX?=
 =?utf-8?B?WVowR1hpTnpvMTlNVzg3Q1RkVzgzZlNFYk91UFlEZkZCV2pQMGFiNlBsbE5L?=
 =?utf-8?B?OGxnbVBuS2pUbVpsSFpsT3c2clpzSkVNeElZd3UvUTZUaVlEbjRpejBNeTlm?=
 =?utf-8?B?OEtjSll0NVE4MTNxWWZWUVpuak4wUVBJUitmTStyRWJqOEVqUmtVSXFXaTcx?=
 =?utf-8?B?Wkw5UnloZG1HOHVaY253amZ4dGN3YjBGUURnQUlCSk8xd0xhbkpISnpqcVVz?=
 =?utf-8?B?MDJRa1VTeDRsWmFwTnlhZGhWUFVlYys5NXlBZmFJWHVzZlUvZUo2YTRGam44?=
 =?utf-8?B?T3l0Kzk1Z0lpMThMcTZiMkhXc0Jxd1lMV0ZLYUVDYlFoUlIrSTBkb25XalEw?=
 =?utf-8?B?UERsL3FTdDB1ZDJ2MUM0R0hCbkI5dUFOVWI3NWlXODZOeFE4OFM0YUFkSFBp?=
 =?utf-8?B?KzVRRGRPSEttbC9tVUZvWlVEbVRrLzV0UU9zYnczWVh2QzRIODhiUW9mS3lC?=
 =?utf-8?B?UWM2WEVqOGdxaFFlTkNxRmV5a2RyWS9oTkZRcUpYT0pkajFlK3NPTlY2UGdk?=
 =?utf-8?B?c2FORnVGaU8vVFdjR3R2cFplZWViZi9haXVDMnVFRzQ1UTNqSlVlRGhvM1kw?=
 =?utf-8?B?aGNJZnNCZ1dtbmVYUWFQWUhORnU0OVBpZHZ3NlhkL0lMeWFrSkxiVGRCMmp5?=
 =?utf-8?Q?dNrR4nOWoH5e+jEuaWka9KMYO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23157456-ffe0-4f91-6e28-08daae2d98dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 21:46:48.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBzofgM9DFX/EUOm82MrgYNjfLBHKCVYB97cMoaOo1E9TbYgInSm1S0hEPvI+oT/VL2rsJsE7CJ2zC5JpoP5Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5139

On 10/14/22 12:16, Stuart Yoder wrote:
> On 10/13/22 4:41 PM, James Bottomley wrote:
>> On Thu, 2022-10-13 at 17:14 -0400, Daniel P. Smith wrote:
>>> On 10/13/22 17:06, James Bottomley wrote:
>>>> On Thu, 2022-10-13 at 16:54 -0400, Daniel P. Smith wrote:
>>>>> Pardon the interjection.
>>>>>
>>>>> On 10/13/22 15:20, James Bottomley wrote:
>>>>>> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>>>>>>> On 10/12/22 14:05, James Bottomley wrote:
>>>>>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert
>>>>>>>> wrote:
>>>>>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>>>>> ...
>>>>>>>> It is theoretically possible to emulate a CRB TPM with just
>>>>>>>> a
>>>>>>>> single
>>>>>>>> communication page and an ACPI entry (the Linux CRB driver
>>>>>>>> is
>>>>>>>> ACPI
>>>>>>>> only
>>>>>>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>>>>>>
>>>>>>>> The CRB device responds to a very compact MMIO region (0x30
>>>>>>>> bytes
>>>>>>>> long)
>>>>>>>> described in the CRB spec:
>>>>>>>>
>>>>>>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
>>>>>>>>
>>>>>
>>>>> IMHO I would not use the mobile CRB, which was designed as a
>>>>> doorbell solution for ARM where trapping a page was not possible.
>>>>> Since it is possible to trap on page access, this makes it
>>>>> possible
>>>>> to implement the PC Client MMIO interface and enables
>>>>> implementations
>>>>> to provide the complete set of TPM capabilities, e.g. localities.
>>>>
>>>> You mean the TIS interface:
>>>>
>>>> https://trustedcomputinggroup.org/resource/pc-client-work-group-pc-client-specific-tpm-interface-specification-tis/
>>>>
>>>>
>>>> We discussed this at length with AMD ... which I think isn't
>>>> captured in the email archives, unfortunately.  However, the bottom
>>>> line is that TIS uses a FIFO approach to sending data through the
>>>> MMIO page.  That's simply unscalable for pure emulation because it
>>>> will result in 10-100x the number of write traps in the MMIO page
>>>> as the CRB driver which uses a MMIO mailbox to trigger actions but
>>>> passes the data via physical page addresses not FIFOs.
>>>
>>> Yes I am referring to the TIS interface but FIFO is only one of the
>>> software interface defined in the spec. There is also the TIS CRB
>>> interface which I should enable a similar experience as the mobile
>>> CRB.
>>
>> Well, not in the above spec there isn't, it's a pure FIFO.  I think you
>> might be thinking of the PTP spec:
>>
>> https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
>>
>>
>> which defined locality mapping for the CRB interface (among other
>> things).  But regardless of the TCG maze of slightly overlapping specs,
>> I think you now agree we can't use the FIFO interface because of the
>> high access trap overhead.  The outstanding question is over
>> localities, but simply implementing the PTP multiple pages won't give
>> us that.  It works for physical hardware because there's an motherboard
>> implementation specific way of shutting off access to MMIO registers at
>> a given locality.  We'd have to define such a thing for the SVSM ...
>> but, as of today, it's not really properly defined for OVMF, indicating
>> no-one's really using it as a security property for virtual
>> environments.
> 
> Unless you expect to have some kind of virtual DRTM, all you need is
> locality 0 in a virtual environment.
> 
> You could invent a new CRB-like interface, but how will it be advertised?  
> Through a new ACPI table definition that has to
> get accepted by the UEFI Forum?  Updating the TCG ACPI spec?
> And you will obviously need new drivers for each OS to be supported.

Since we're talking about enlightened guests, we can query the SVSM 
(through the SVSM_CORE_QUERY_PROTOCOL API) to check for the availability 
of the vTPM protocol. If present, then the OS will know to load an SVSM 
vTPM driver. This could be done, for example, on Linux, by registering a 
platform device.

Thanks,
Tom

> 
> If you want to use a standard CRB and avoid overhead due to polling
> in an MMIO interface you can implement the CRB interface completely in
> normal DRAM, which is what is done for Trustzone-based firmware TPMs
> on Arm.  The Mobile CRB spec specifically allows this. But, you will need 
> a doorbell mechanism to signal the TPM to "start" operating on
> a command that has been put in the CRB in DRAM.  The Linux CRB driver
> works out of the box with this approach.
> 
> The standard TPM2 ACPI table could be used and all you need to define
> is a new start method.
> 
> There are tradeoffs for both approaches.
> 
> Thanks,
> Stuart
> 
