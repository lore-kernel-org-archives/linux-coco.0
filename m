Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079D257A
	for <linux-coco@lists.linux.dev>; Tue, 28 Jun 2022 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656413445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fBnpEBJJsEjj4xp1XzlNmSDPEps8RE1TeLCO9pCV3b8=;
	b=SkYaCJ3aw8yYG2A60W8Ls7UT3W3arTz5lw4NWYcdT7U7QRxu3PK3+Lfs5BjOOINVWLy0RS
	UleCkdMpeB82MEE3pyIEMET2YmQPTwa/t+5kGkywSBScOWv0kdHOaL0G09aTsQGfJEWP6p
	SGiitsAeu9mg3Iho4eDKH9Sd1k771p4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-_RWsG1afOYSCrNMBFUD0_g-1; Tue, 28 Jun 2022 06:50:44 -0400
X-MC-Unique: _RWsG1afOYSCrNMBFUD0_g-1
Received: by mail-wr1-f71.google.com with SMTP id n7-20020adfc607000000b0021a37d8f93aso1725778wrg.21
        for <linux-coco@lists.linux.dev>; Tue, 28 Jun 2022 03:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fBnpEBJJsEjj4xp1XzlNmSDPEps8RE1TeLCO9pCV3b8=;
        b=zXEJEdhPNfP5/xmnXeNQZTWfpCZyEr1TRAuHSo+Z+w54TxH/DKwKZOXfrNS1u4m+Y2
         /pIPF31BxGcUT5him5oOgY2xvKyBSmK732Oh0kZPqZVZ+4jnfFCaeO2PKzR04ySrl5/Y
         XLhTi6GTd6XYr3TCgqmMTxwk4IKBTydnOr8fa3pv4siHHjFvy3iPngcj8SpUPP03izqW
         zOyIeXXuGVRaeOKwBaaYon/1pSBAPOTYEbnOtKb4nTZN76mlyHG4YXGxlHpS8WuckFqS
         QKbKYrjNjrcIqAiavfsIUM69DGN68Q8hHbzAcDd4CF4vQ5ojiL+COy55dpYL9Rq70vEC
         vgcA==
X-Gm-Message-State: AJIora9mqmXL3DAf6MVqmvq+cYZqjmmi/LakEzJfW+ENq7RI6c1T5vIx
	CLk6JgArAh+kPIpXUUyvMGxRRhdIBx1kVBcLH9jPzEfaAeXmgWhdzJYBspZJV97MW+17NzdptlH
	teyaM5PUwuqEby8zX55CxUg==
X-Received: by 2002:a05:600c:1547:b0:39c:7fc6:3082 with SMTP id f7-20020a05600c154700b0039c7fc63082mr26228183wmg.189.1656413442952;
        Tue, 28 Jun 2022 03:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOc62+TwZm4Lysu7PiidKj6NprJiStBGJ45lIax1y18ihr6TTIBSDrSl64O72de4xS9gTWfQ==
X-Received: by 2002:a05:600c:1547:b0:39c:7fc6:3082 with SMTP id f7-20020a05600c154700b0039c7fc63082mr26228150wmg.189.1656413442750;
        Tue, 28 Jun 2022 03:50:42 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d4ecb000000b0020fe61acd09sm13521418wrv.12.2022.06.28.03.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 03:50:42 -0700 (PDT)
Date: Tue, 28 Jun 2022 11:50:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>
Cc: "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"jroedel@suse.de" <jroedel@suse.de>,
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"jmattson@google.com" <jmattson@google.com>,
	"luto@kernel.org" <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"slp@redhat.com" <slp@redhat.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"rientjes@google.com" <rientjes@google.com>,
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
	"tobin@ibm.com" <tobin@ibm.com>, "bp@alien8.de" <bp@alien8.de>,
	"Roth, Michael" <Michael.Roth@amd.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"kirill@shutemov.name" <kirill@shutemov.name>,
	"ak@linux.intel.com" <ak@linux.intel.com>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"marcorr@google.com" <marcorr@google.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"alpergun@google.com" <alpergun@google.com>,
	"jarkko@kernel.org" <jarkko@kernel.org>
Subject: Re: [PATCH Part2 v6 06/49] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
Message-ID: <Yrrc/6x70wa14c5t@work-vm>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <e4643e9d37fcb025d0aec9080feefaae5e9245d5.1655761627.git.ashish.kalra@amd.com>
 <YrH0ca3Sam7Ru11c@work-vm>
 <SN6PR12MB2767FBF0848B906B9F0284D28EB39@SN6PR12MB2767.namprd12.prod.outlook.com>
 <BYAPR12MB2759910E715C69D1027CCE678EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <BYAPR12MB2759910E715C69D1027CCE678EB29@BYAPR12MB2759.namprd12.prod.outlook.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Kalra, Ashish (Ashish.Kalra@amd.com) wrote:
> [AMD Official Use Only - General]
> 
> >>>  /*
> >>>   * The RMP entry format is not architectural. The format is defined 
> >>> in PPR @@ -126,6 +128,15 @@ struct snp_guest_platform_data {
> >>>  	u64 secrets_gpa;
> >>>  };
> >>>  
> >>> +struct rmpupdate {
> >>> +	u64 gpa;
> >>> +	u8 assigned;
> >>> +	u8 pagesize;
> >>> +	u8 immutable;
> >>> +	u8 rsvd;
> >>> +	u32 asid;
> >>> +} __packed;
> 
> >>I see above it says the RMP entry format isn't architectural; is this 'rmpupdate' structure? If not how is this going to get handled when we have a couple >of SNP capable CPUs with different layouts?
> 
> >Architectural implies that it is defined in the APM and shouldn't change in such a way as to not be backward compatible. 
> >I probably think the wording here should be architecture independent or more precisely platform independent.
> 
> Some more clarity on this: 
> 
> Actually, the PPR for family 19h Model 01h, Rev B1 defines the RMP entry format as below:
> 
> 2.1.4.2 RMP Entry Format
> Architecturally the format of RMP entries are not specified in APM. In order to assist software, the following table specifies select portions of the RMP entry format for this specific product. Each RMP entry is 16B in size and is formatted as follows. Software should not rely on any field definitions not specified in this table and the format of an RMP entry may change in future processors. 
> 
> Architectural implies that it is defined in the APM and shouldn't change in such a way as to not be backward compatible. So non-architectural in this context means that it is only defined in our PPR.
> 
> So actually this RPM entry definition is platform dependent and will need to be changed for different AMD processors and that change has to be handled correspondingly in the dump_rmpentry() code. 

You'll need a way to make that fail cleanly when run on a newer CPU
with different layout, and a way to build kernels that can handle
more than one layout.

Dave

> Thanks,
> Ashish
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

