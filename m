Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646D03FD2
	for <linux-coco@lists.linux.dev>; Wed, 15 Sep 2021 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631713892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rftZ+5MAkOWpGqIg+qkRIqNakYxlTPCCATzwPiV0xWY=;
	b=F/oPF126bT3Sn3sq1hxeoOz2sxobkWNrYImQnazM1HjT+thk9IrEZfw28t0P6HCVriPsKJ
	rwPYNhSQCDFgj8imBzbxFgY3NmIZpbKnOl+e1wem/xTb5q16YTo4wxdytPtKS2+5n5FQ3e
	ETzZjqjMockrsmVwfWLj/+iGVEnxgDU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-z5hOyfEuNwaTNPpquP2sFg-1; Wed, 15 Sep 2021 09:51:29 -0400
X-MC-Unique: z5hOyfEuNwaTNPpquP2sFg-1
Received: by mail-wm1-f72.google.com with SMTP id m4-20020a05600c3b0400b00303b904380dso1684483wms.6
        for <linux-coco@lists.linux.dev>; Wed, 15 Sep 2021 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rftZ+5MAkOWpGqIg+qkRIqNakYxlTPCCATzwPiV0xWY=;
        b=oFCrTx2K51fHx4qPge32Zdj2IME++2MCF4YTtq6zOayHagBsOnBtgW4M9EDB20gJvt
         UlDZATlu+yPm5AUbYDzHuour4HSwCTs+bvJitTFn0V8qcolWNfTtJanmjYJKOLyuJXpt
         zDuXP9c/Wgrozyb1kMJYkDg7K50Su+2BxFhJ11Dv7kE3AZZbP7f5nHYuNYrNoriPsReC
         SVCDKUkQpWEmZ2Y0ljsJ9lYYbJpBBB33x3llR+DcdOG73k4Q6vyi0BTiS5rHUuHTW0kp
         ILU1ub84Obxe+Z2CviN1rEKZ1Qm5aEcDL1ZAtH/pwvt5jkp1xHMiYVahs/8H/TI9TfsH
         XwrA==
X-Gm-Message-State: AOAM530TRoFP8rZkFsRW2wOi2HVI13aVfQoq/UfFOweTvS+NLnDutHUb
	bnonq8seQwxpxy5UAaVjbpuikE8o3F/ecPpx7VbWOnNzSkPdRDCiLpflyMiX2nw3dRpwAH9L8+B
	xfxSls53mPIh3YmTjF+ajJA==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr5214954wrp.435.1631713888029;
        Wed, 15 Sep 2021 06:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzoCluIVhqAjakmpKSc6PYwGiKjxORx84eAMcvC6SnZF/I8Yda43+I/iYU0yIbeHiK6R7lTA==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr5214922wrp.435.1631713887745;
        Wed, 15 Sep 2021 06:51:27 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6426.dip0.t-ipconnect.de. [91.12.100.38])
        by smtp.gmail.com with ESMTPSA id q11sm29856wrn.65.2021.09.15.06.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 06:51:27 -0700 (PDT)
To: Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Andy Lutomirski <luto@kernel.org>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <20210902184711.7v65p5lwhpr2pvk7@box.shutemov.name>
 <YTE1GzPimvUB1FOF@google.com>
 <20210903191414.g7tfzsbzc7tpkx37@box.shutemov.name>
 <02806f62-8820-d5f9-779c-15c0e9cd0e85@kernel.org>
 <20210910171811.xl3lms6xoj3kx223@box.shutemov.name>
 <20210915195857.GA52522@chaop.bj.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
Message-ID: <51a6f74f-6c05-74b9-3fd7-b7cd900fb8cc@redhat.com>
Date: Wed, 15 Sep 2021 15:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210915195857.GA52522@chaop.bj.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

>> diff --git a/mm/memfd.c b/mm/memfd.c
>> index 081dd33e6a61..ae43454789f4 100644
>> --- a/mm/memfd.c
>> +++ b/mm/memfd.c
>> @@ -130,11 +130,24 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
>>   	return NULL;
>>   }
>>   
>> +int memfd_register_guest(struct inode *inode, void *owner,
>> +			 const struct guest_ops *guest_ops,
>> +			 const struct guest_mem_ops **guest_mem_ops)
>> +{
>> +	if (shmem_mapping(inode->i_mapping)) {
>> +		return shmem_register_guest(inode, owner,
>> +					    guest_ops, guest_mem_ops);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
> 
> Are we stick our design to memfd interface (e.g other memory backing
> stores like tmpfs and hugetlbfs will all rely on this memfd interface to
> interact with KVM), or this is just the initial implementation for PoC?

I don't think we are, it still feels like we are in the early prototype 
phase (even way before a PoC). I'd be happy to see something "cleaner" 
so to say -- it still feels kind of hacky to me, especially there seem 
to be many pieces of the big puzzle missing so far. Unfortunately, this 
series hasn't caught the attention of many -MM people so far, maybe 
because other people miss the big picture as well and are waiting for a 
complete design proposal.

For example, what's unclear to me: we'll be allocating pages with 
GFP_HIGHUSER_MOVABLE, making them land on MIGRATE_CMA or ZONE_MOVABLE; 
then we silently turn them unmovable, which breaks these concepts. Who'd 
migrate these pages away just like when doing long-term pinning, or how 
is that supposed to work?

Also unclear to me is how refcount and mapcount will be handled to 
prevent swapping, who will actually do some kind of gfn-epfn etc. 
mapping, how we'll forbid access to this memory e.g., via /proc/kcore or 
when dumping memory ... and how it would ever work with 
migration/swapping/rmap (it's clearly future work, but it's been raised 
that this would be the way to make it work, I don't quite see how it 
would all come together).

<note>
Last but not least, I raised to Intel via a different channel that I'd 
appreciate updated hardware that avoids essentially crashing the 
hypervisor when writing to encrypted memory from user space. It has the 
smell of "broken hardware" to it that might just be fixed by a new 
hardware generation to make it look more similar to other successful 
implementations of secure/encrypted memory. That might it much easier to 
support an initial version of TDX -- instead of having to reinvent the 
way we map guest memory just now to support hardware that might sort out 
the root problem later.

Having that said, there might be benefits to mapping guest memory 
differently, but my gut feeling is that it might take quite a long time 
to get something reasonable working, to settle on a design, and to get 
it accepted by all involved parties to merge it upstream.

Just my 2 cents, I might be all wrong as so often.
<\note>

-- 
Thanks,

David / dhildenb

