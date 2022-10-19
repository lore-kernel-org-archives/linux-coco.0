Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168A7E
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 14:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XReSFGmkHcMocUnddIDp+m7JyE2evNc1XVBmrZ6Z21rOBtkJSBFKkDV28iavle5+f/diBccAgpv3N9XaCJLAirv4rebVGgiIvpb75kDdGchP593fvs7niTJM5ooIgRZMuD+HA3AZFGYsGQMGccyiFHZLGFEfF6sbGK5pnAn/W841xURRLMV0ccC3BAu3hERGQa7wnKLkktla3qzf3G27o5R1MOP4D0Vji+WbMuhBYRFjB8gS8+dY1JXkh+zXTROOfaqYHCIigoG80ywDPYzmUmMySfTR/xh/QC2pyuc3yYIFy9jTdob+H10kSK9ZFpluUhpxl0Ry3jI/sPfq8g2ODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ez14ZVzP5YQCJfBqKlHD4dGZ9rpLMNmbUY3M1kcAFxc=;
 b=aInl/nuj2/jNCDyrawKneSrX/39LsKw79c9onXrI8veqHdNZqoKcrwkC8Sr88WIAo5kC8OB5n44sNP9FvQln0AmLn2k68UtRueOSegGaX/Afn2pP6QGGhM6ksvG0OdiKmWzvJaC+0ciPEQv3ugoPm1CEDxPQ9BekZAOgTcGy8OvM6mXe6dFtoNgUOLksl7wB8z9U7L54n29YwuNN7qlBn9tEOMWGI1aBujiMXI3zlOfOtkCKmG0tIifFputsH1SpkClGESK2EUNMmKCejil3ZABXCRgrYth0ABiTausGzvcj3dnSRWJVzN81WYSQBmwMKv1PzRc3RtJov0n0U3lL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ez14ZVzP5YQCJfBqKlHD4dGZ9rpLMNmbUY3M1kcAFxc=;
 b=qOuUuL2Q6bNDzSQmsqGKpzdYqPqaaIB8goZte+BCZ3sQIQ/AqnNt9HkA3kvFPS5OrIcGPUSH2ptBJhG7lptVSHFhoCrFI8Y7EnSDgeu3jdnBFcA2Ov5W72T4ChpO/vDdoObo0Y94gM9GMyf7s5eZ7n73NTKa4Ds5TxV2es2sKmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SA0PR12MB4589.namprd12.prod.outlook.com (2603:10b6:806:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 14:43:42 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00%2]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 14:43:42 +0000
Message-ID: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
Date: Wed, 19 Oct 2022 09:43:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com>
 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
 <Y0/2D93P/xgp1sU9@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y0/2D93P/xgp1sU9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:610:e7::20) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SA0PR12MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e529e25-51b7-4f16-fab2-08dab1e050fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LdhNPDTGUiF9jgC+Qs33/9PkmwN1JV6kcHXMIXaLVysV+O4J01XyzHRhaK+Eqt7hA7aMRH865SdioNKg9Nnk3agrMA6vIeWAcMYPiZ/3j8VmpZtWk7t3L90LuR4p36F06CsF+wWZsSblg2jzYCaBOQP+bgX80NPrTvvd6Yas0EijW+ln71VXfm7jgAGDIUnjlfn3SzjEK+1vyLqsu6il4CNiiWNI+J2iBd7qzK+Ya4nOZla2hr8Mzt2T2L7aSEhO7gYw98rhNzPU809iYm/oih87/GIya5jxRr6kq+ab0nN4B6Q/+l9FsrN9LMX32mpPp0KaIxKErq38cZ59z6OIpLLl3oIHikbLhlSBa3lgUdyEQFKhYJGrjLZDF4DpKh8QiT1vvc9o67KJ62CHgD3+gNXwPrA6EBAkjdccvnvHJ7Ucje9Fw2jD+nGgjVSOS80WhM9ZSuoLFm+vBGcNrG5C3MnpqqTub6oZR6KeTRTlIJsBpA30QNSJWVLR8FQRI/on4ABuQAeiynyICv64oU87bBX1X2KkaBtI5599cEat7ipobSwraWaRPRxmFIPMDWXsV003LPm15FBbPqSXlndxTnwIr45e1o2lD8dh0k9qP3k4YxoDNqZWNOCuspyJGqIqObqIauIikXWudlTxir0Nn7fzqbAkqD+7jsVfAJJGgvvwZMF8zk+FArch36hjLj3DOzg04viawN+DdswDypdJ7SXIVI4acwNKPDsjDdsCf/Amguwm9vi9gQeUof/ppgCWwMaJ2bGdYOpcmzA6Rlbl5JV26gsD2P3prHqri0qtbFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199015)(31686004)(478600001)(83380400001)(86362001)(31696002)(6486002)(66946007)(36756003)(66476007)(66556008)(53546011)(8676002)(6506007)(316002)(41300700001)(26005)(6512007)(8936002)(110136005)(4326008)(7116003)(54906003)(5660300002)(2616005)(4001150100001)(2906002)(186003)(3480700007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rmg5UWY0ZWlyZDg5dVdRb0U0WUYrZEJMNHhiYktqbjFmV1drdUR4ZmJoSW83?=
 =?utf-8?B?VXJIZEI5UTNha1IwRUpOdmRYSnFybnkxT0h0RGJ4dHE4cG55SE1Xd3krMlRk?=
 =?utf-8?B?N1FBVUpkN2Y3UDNCV0RKRTRuajRCSDBJSjE0ekFOai9QOGtuUUdkZWxPMXgx?=
 =?utf-8?B?WXorVWlSWTZyK2kvUzRseERSR21QVEk3cVRTVVUydnNjMnlVNnRiSS8rQUt0?=
 =?utf-8?B?MDRqU3FqQ1BHNDdSQUtsbmVZQ2w5UW9mVmp6UlBGSXpxbGV0R2pRWW1YeCtK?=
 =?utf-8?B?QU5kdTNLL1p2ZzAvVTdYTWp5L2JCWlZZc29WYXRGcExtZHpVTWFZVFBwS2l6?=
 =?utf-8?B?OXhhYXFzTEFNa1hLNHBjbkk2WTl3SHVKUTE0RHZzL0NjMGNuQTE1b2h6eUlC?=
 =?utf-8?B?OW9BdEdvdVJkNWlISlBJU2NNOTRuT29jUW1lRXoyT01YQlhPSkVoR1BwSHBv?=
 =?utf-8?B?MTZMb3JrUHFMT1ExL0pZL0x2SFl0cWdIZU5LRFBabHN6clh5Tm04RnhUYlIv?=
 =?utf-8?B?V1VLNG5JM3dqU2tGcWZIUzFWNlhlSG9hNGRmN2RGN3dlV3RXcU5wNlF0ZE1k?=
 =?utf-8?B?YUllSk9veUVDMWM4Vi95Z0ZhNjkzS1VESklFSHdWL3k3VDBzQWhEMzNUQU4z?=
 =?utf-8?B?NllLTkp3T0lHaUdhQVJsZUZzZ0plc1B2blhwQ0pPNzdjM3JlQmEydW5YNGgz?=
 =?utf-8?B?YWIyaU9lbjFyNkdFOVNQdTdRQy9TUFpxcURUZHRBRHZ0T2pxTTJzbXFmYlRu?=
 =?utf-8?B?SEpVdS9FY09yM2lKMGxaY1YzTjRZZDJPTC9oYmFHY1VUKzZySmhPUFJYNkp0?=
 =?utf-8?B?dURaNlBFMWVLMjRUVEtob01GczlTNkFsbUczeUJNa281YnA3eFBuZWNFckNz?=
 =?utf-8?B?TUNWMGl0b0xBdi82czMyb25qb0x5SUZZZlBUcjQyN0VlN3hsNnVueDhXcXdO?=
 =?utf-8?B?MnM2eUtVRXdhWGpFaUNKUHBmK3lxZEdBbTN6Z3pIVjgxK3E3Wm9VRTVhOU14?=
 =?utf-8?B?TmRUUVB2VG1MTktkR1RvaURwRkZCZmw4T2d0WTE5L0x5ZUxrdUY5akovZzBX?=
 =?utf-8?B?dWRhWVhjN2xVdi9aQlFNZnRhVUltWkprWEZiMHl1R2RZMWM3cUs5NjFSemE2?=
 =?utf-8?B?K2NqVUR2SC9GZWR4Y3hPSXpzMVlPWWVLVm1NT0kyWVhtdWlGd3JmMU1JalMv?=
 =?utf-8?B?L3BOUmNIN3BRQlBSWEg5VmFQNERkWGM1ZHhjWWxZZXhLL2duZ2JIdmEvUHpr?=
 =?utf-8?B?Wmp0YncxT0ZoRld5R1lCRFllYU9LVW1ENDFCWGRzYUY2WEZ5M05VMitkVGxE?=
 =?utf-8?B?aUx4L2RGczhaYm9sSHhRdThOS2tjV3RnUUFnWFFYWTk0OHk1b0NVYUd1cHhy?=
 =?utf-8?B?YjA3RnJjakNnYVpwM01RU3c1UXBmak5OVDJpNHpqUmhuT3NKMDB3di9QQzdE?=
 =?utf-8?B?eTlwUE5temdDcXlKWElJdUtZUWhDc0YyTXlkWU5NR1lmUUtKOGVnUlJHQS9Z?=
 =?utf-8?B?NWtDMWd6UlllTGJZWlZvdmJpc1hTanVrNUVnalZrWUx4RHlLS1Y4RXUyRjdy?=
 =?utf-8?B?YzJvZWJuaFlrNnYyYUx2eEJjSVVTOWluU2Z2U2NsQ21wZmlZQ0tVeWtFaHJZ?=
 =?utf-8?B?QzV0U2s0Q2VlcWo0RWwwakhYVmUwTmJHaHFOYnlpTDJQcVYvd0RQdURMQzRM?=
 =?utf-8?B?TzRZL09LdDBBMCt1M0NxLzZJNmEveWozK1Mzd0c0YllxcHBSMUhqM2wzQlVl?=
 =?utf-8?B?SnltZm16c2Z3Z3AwMVpFY0FlcVVSRXlnNlhNNEtibFJQcE42MUdxaGdVUDcv?=
 =?utf-8?B?eElwRGtBLytZM0tPWGFtU0orQndZUEZKYTdRZVFtY051TmpaUVpmZHhkTENN?=
 =?utf-8?B?UHVTK3lmbGIySi9xaERSa1JZYmMvT0N4OGVUQmVmYm5zUXM3RC93Y2Ftekho?=
 =?utf-8?B?ckhtQmtiL0lpZlExaU5neklOWG9aV0l3Wk5reTJ6M0J0dW5leXRWVklwekhw?=
 =?utf-8?B?ckF4UktuRFpYVHFFenVMd0hVazZ1SG1qTmp0RCt0ekZWV0g1OFRCT010ZmpL?=
 =?utf-8?B?bkhjdzluSmExcWtxSTRXRHNEN2U0Ty80aE16RXJqaGdIWHd6L2dhYnlneFRu?=
 =?utf-8?Q?39yDw/LbJX7vFXgvyzQj5xxbO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e529e25-51b7-4f16-fab2-08dab1e050fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 14:43:41.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+OLlMsTwDYo7RSLbyc6H2PwafNubBBnOgQuBmGdLNdPuhEwtMtzPxE2Bg0tjrH3vlt6CLOo/PRk3mqxyN7inQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4589

On 10/19/22 08:05, Daniel P. Berrangé wrote:
> On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
>> On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
>>> I'd be inclined to not rely on guest networking, and probably even
>>> strictly decouple what the SVSM does to communicate, from any
>>> specific attestation server connection protocol or details.
>>
>> I think we should be clear: if you need a secret at start of day,
>> before the guest boots, then you need to retrieve an attestation from
>> the SVSM and inject a secret.  If you can delay needing the secret
>> until after boot (say for data volumes) then you can use the cloud
>> standard methods we have today (which actually do mostly operate over
>> the guest network path) and a TPM which manufactures on boot.
>>
>> However, the above mechanism is out of scope for the vTPM project.
>> This is simply about putting a vTPM into the SVSM which appears in the
>> guest as a TPM and providing a guest API to retrieve its attestation.
>> So the scope of the project ends there.
>>
>> If we want a TPM with persistent state, then the state has to be
>> injected pre-boot but that is the same pre-boot problem as all secret
>> injection.  I think there should be a separate project working on this
>> and we'll make sure they interlock correctly.
>>
>> So I think there are three pieces
>>
>>     1. Ephemeral vTPM with attestation retrieved from guest
>>     2. Attestation and injection API from SVSM to host/guest end point
>>     3. SVSM API for saving TPM state
>>
>> We'll work initially on 1. Someone else can work on 2. but we'll make
>> sure they fit together.  3. would be required for full TPM emulation,
>> but might not be required if all we want is persistence of the seeds of
>> the TPM, so this would be evaluated when we have 1+2.
> 
> Yes, that all makes sense to me as a division of concepts & work.

There was some offline talk about possibly putting the attestation report 
in the TPM NV area and allowing it to be pulled via TPM commands. However, 
if we want to be able to supply a new NONCE each time, I think, instead, 
that calls for it's own function in the SVSM vTPM protocol.

Currently, there are two functions in the vTPM protocol:

   1. An attestation report function
      - Input:
          - NONCE GPA (RCX)
          - NONCE size (RDX)
          - Report destination GPA (R8)
          - Report destination size (R9)
      - Output:
          - Result code (RAX)

      NONCE copied to SNP MSG_REPORT_REQ:REPORT_DATA[511:256].

      SHA-256 (EK Public Key | SRK Public Key) copied to SNP
      MSG_REPORT_REQ:REPORT_DATA[255:0].

      On success, the report is present at Report Destination GPA.

      If a new way of creating REPORT_DATA is needed in the future, the
      protocol could be extended with a new attestation report function
      (following the SVSM Core Protocol design of being additive).


   2. A vTPM operation function
      - Input:
          - Command GPA (RCX)
          - Command size (RDX)
          - Response GPA (R8)
          - Response size (R9)
      - Output:
          - Result code (RAX)

      On success, the result is present at Response GPA.

      @James Bottomley, I noticed in an earlier response that you had the
      Response size as a possible output, is that needed? The response
      output (header) contains the actual length of the response.

Are there any other functions that are needed?

Thanks,
Tom

> 
> With regards,
> Daniel
