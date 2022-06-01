Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052692562
	for <linux-coco@lists.linux.dev>; Wed,  1 Jun 2022 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654094364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlU0tkzpCjcg/jU3LgCOcXpRFl3qkGqk9lVl6FW9S+g=;
	b=IiaxLnkzl09OU8QL1+gL/VMiH3zdlsa0C5BSfpkh61xG65nJ+wu2Q1uMp1O8HgqjoYJbhq
	ecCbr88QHeTEjxLgJSGMI5j3fHwVkdWRifN48XF1gc/k6mWsxoNGBdcwF5IvKI32/9s2ro
	zYy9L0/Bw465yUGje4/3i75XFuM0H5M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-QRF6Qa-FM9qS8M_eKwY1Eg-1; Wed, 01 Jun 2022 10:39:21 -0400
X-MC-Unique: QRF6Qa-FM9qS8M_eKwY1Eg-1
Received: by mail-wr1-f70.google.com with SMTP id i10-20020a5d55ca000000b002103d76ffcaso346458wrw.17
        for <linux-coco@lists.linux.dev>; Wed, 01 Jun 2022 07:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qlU0tkzpCjcg/jU3LgCOcXpRFl3qkGqk9lVl6FW9S+g=;
        b=jkhZpUJAs5n+FHyoh5U/GfZ7cR5KMo+uN0KiHWQJ2XKZNx0HMA1tgQ8ykh903/jE2B
         mIBZPOffkgZcLYGOuhntMweaLOolWxjcOb6mVXnqR1UopssF8cdlDXdlp6pE9g23XIMG
         Qr6TdJ+tROg+DL3v+pcCWwtNv4mKB/xcmMsf+XP0SvNgybFY5kqlm32RmcfP2iqm2u80
         Miruvg/HtEouXq5K0oa19nrrbO/7XNeJ6DQkXXyOLHdXXODLBfQ4xqt2et1OxYccFc+3
         xOaLVCuJfOyCRSfliOWVks16f+qSYAMvTMzA3rCPdamiRA1zD7r7SGb6NGUEOWbMJolN
         ss2g==
X-Gm-Message-State: AOAM532JX0/ONXEQbLW7XLfSjE9xbS9k54UM2d/D2RNucuFziSJfp5Qw
	QixfRsQ7xcFqch2EToK1IF+/dJSX1naELzdLwtCBIhnB8oWhdN8CXf64+PhEiu6koh33V0YNRa2
	NqLCjQghGrI0Ffg///nGJ8A==
X-Received: by 2002:a05:600c:1d99:b0:397:482b:429 with SMTP id p25-20020a05600c1d9900b00397482b0429mr28614915wms.130.1654094359707;
        Wed, 01 Jun 2022 07:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZmvS/ySSMSACfcbs5N8wx4zgU89IJgDAitfH9pT2OXqot4AKsgn1nc41biOJdFJqGw1r+Pw==
X-Received: by 2002:a05:600c:1d99:b0:397:482b:429 with SMTP id p25-20020a05600c1d9900b00397482b0429mr28614883wms.130.1654094359401;
        Wed, 01 Jun 2022 07:39:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45? (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de. [2003:cb:c705:2600:951d:63df:c091:3b45])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b00397550b387bsm2720288wmh.23.2022.06.01.07.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 07:39:18 -0700 (PDT)
Message-ID: <116f7be4-7b75-a83b-899b-c23b52534b30@redhat.com>
Date: Wed, 1 Jun 2022 16:39:16 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCHv6 03/15] efi/x86: Get full memory map in allocate_e820()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Dave Hansen <dave.hansen@intel.com>, Mike Rapoport <rppt@kernel.org>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-4-kirill.shutemov@linux.intel.com>
 <b9a0eb0a-ce27-5306-a12f-79d196445254@redhat.com>
 <20220601143515.iavmtysdchirbtel@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220601143515.iavmtysdchirbtel@box.shutemov.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.22 16:35, Kirill A. Shutemov wrote:
> On Wed, Jun 01, 2022 at 11:00:23AM +0200, David Hildenbrand wrote:
>> On 17.05.22 17:34, Kirill A. Shutemov wrote:
>>> Currently allocate_e820() only interested in the size of map and size of
>>> memory descriptor to determine how many e820 entries the kernel needs.
>>>
>>> UEFI Specification version 2.9 introduces a new memory type --
>>> unaccepted memory. To track unaccepted memory kernel needs to allocate
>>> a bitmap. The size of the bitmap is dependent on the maximum physical
>>> address present in the system. A full memory map is required to find
>>> the maximum address.
>>>
>>> Modify allocate_e820() to get a full memory map.
>>
>> Usually we use max_pfn, if we want to know the maximum pfn that's
>> present in the system (well, IIRC, excluding hotunplug).
>>
>> How exactly will this (different?) maximum from UEFI for the bitmap
>> interact with
>>
>> max_pfn = e820__end_of_ram_pfn();
>>
>> from e820 in existing code
>>
>> ?
> 
> I'm not sure I understand the question.

Essentially, if the PFN you calculate here for the bitmap size will
essentially match later max_pfn.

> 
> On EFI system, E820 is constructed based on EFI memory map and size of
> bitmap calculated based of EFI memmap will always be enough to address all
> memory. e820__end_of_ram_pfn() can be smaller than what what we calculate
> as size of memory here, if kernel reserve very top of the memory, but it
> will never be larger.
> 
> Later during the boot we use e820__end_of_ram_pfn() to infer size of
> bitmap and it is safe.
> 


-- 
Thanks,

David / dhildenb

