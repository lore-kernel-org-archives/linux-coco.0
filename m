Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500529CA
	for <linux-coco@lists.linux.dev>; Fri, 14 Jan 2022 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642166563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oeaq06iGyvE0QAALNnhiWPGnYSnujvBuiZVqBWtdPcQ=;
	b=cdr3kX0sgyA/z/BdCzyxXQkl3q5dv3RTj1vHBsmUAQAz7xdYK7FA6aQfL+6RiX6MuVpjki
	axdwfKI7N6y47/wmRzZWhAhsgIZmYWgOa2i5qLPk2dVX7vDcKN9CCNPc3qobsKw/I+HDeB
	2lrbvtrmqY0r21qHJFWaZCtsZarSgEI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-XRBlUrxKOL-mWFuAvDtJZA-1; Fri, 14 Jan 2022 08:22:37 -0500
X-MC-Unique: XRBlUrxKOL-mWFuAvDtJZA-1
Received: by mail-ed1-f71.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso8317337edc.23
        for <linux-coco@lists.linux.dev>; Fri, 14 Jan 2022 05:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=oeaq06iGyvE0QAALNnhiWPGnYSnujvBuiZVqBWtdPcQ=;
        b=m62O0EOMbUjAsjbw+NKkSpIkufgqSBTM7CqbyxsJFXl/TJrociP/Q4YLvIe8R//ezi
         5qE6Qsu1JpqZnU8t06zQd8p1noDRO2VsDcPck0Je/sIg1pngpJg4n0wappFhICJBGAqV
         dSEPYvqOfUMEbqJQ65VaSmDziM4Hv45k42k3vUCzQsclC8TLqGu+HNUANz2NF1r6YNZa
         Isy6fUQ0OgOJr10lFo/6f+vmX/yhZ1FAfvrgv2Yaxwxk5KT4YinACdWQ6q/yLcfz+At0
         hnbI62bqyVmgfpJjcSPHgnWN2S+mKxpB8lhnPn5mgIMi5Yxskd3lmGrOtbaMvLa9djri
         3L3Q==
X-Gm-Message-State: AOAM531rbl0ZMcnOiB2S1zFrnwad9gJolhm0PA+fTrsYJ28sR38Nn/nb
	/kAOGc59GbasqHE0erYdYffVTi8+zVrlo9sYHbO+x3l//ktrpqwasP6YP1oqmsaHhDil3dBMr5Y
	16VzCF0rSZCaITKwlHELXEA==
X-Received: by 2002:a17:907:da0:: with SMTP id go32mr7626086ejc.206.1642166556195;
        Fri, 14 Jan 2022 05:22:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS9vZNX3oQ6i39jM2FKgLuz6f8PXERubRE87h6Ubd8Gv/YN4aNXBeXwCcra2gmHtmx8Cv73A==
X-Received: by 2002:a17:907:da0:: with SMTP id go32mr7626059ejc.206.1642166555864;
        Fri, 14 Jan 2022 05:22:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:9d00:ff87:1c9b:108a:9702? (p200300cbc7019d00ff871c9b108a9702.dip0.t-ipconnect.de. [2003:cb:c701:9d00:ff87:1c9b:108a:9702])
        by smtp.gmail.com with ESMTPSA id o1sm2377554edv.2.2022.01.14.05.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 05:22:35 -0800 (PST)
Message-ID: <1549f9f8-92a5-21f6-23ef-f3e6217df1c3@redhat.com>
Date: Fri, 14 Jan 2022 14:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
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
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-2-kirill.shutemov@linux.intel.com>
 <3a68fabd-eaff-2164-5609-3a71fd4a7257@intel.com>
 <d84e242f-f7f6-4fb0-8f22-bcc790a296a0@redhat.com>
 <20220112191510.6uqdflbreuet7bnx@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCHv2 1/7] mm: Add support for unaccepted memory
In-Reply-To: <20220112191510.6uqdflbreuet7bnx@box.shutemov.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.22 20:15, Kirill A. Shutemov wrote:
> On Wed, Jan 12, 2022 at 12:31:10PM +0100, David Hildenbrand wrote:
>>
>>>
>>> Looking at stuff like this, I can't help but think that a:
>>>
>>> 	#define PageOffline PageUnaccepted
>>>
>>> and some other renaming would be a fine idea.  I get that the Offline 
>>> bit can be reused, but I'm not sure that the "Offline" *naming* should 
>>> be reused.  What you're doing here is logically distinct from existing 
>>> offlining.
>>
>> Yes, or using a new pagetype bit to make the distinction clearer.
>> Especially the function names like maybe_set_page_offline() et. Al are
>> confusing IMHO. They are all about accepting unaccepted memory ... and
>> should express that.
> 
> "Unaccepted" is UEFI treminology and I'm not sure we want to expose
> core-mm to it. Power/S390/ARM may have a different name for the same
> concept. Offline/online is neutral terminology, familiar to MM developers.

Personally, I'd much rather prefer clear UEFI terminology for now than
making the code more confusing to get. We can always generalize later
iff there are similar needs by other archs (and if they are able to come
up witha  better name). But maybe we can find a different name immediately.

The issue with online vs. offline I have is that we already have enough
confusion:

offline page: memory section is offline. These pages are not managed by
the buddy. The memmap is stale unless we're dealing with special
ZONE_DEVICE memory.

logically offline pages: memory section is online and pages are
PageOffline(). These pages were removed from the buddy e.g., to free
them up in the hypervisor.

soft offline pages:  memory section is online and pages are
PageHWPoison(). These pages are removed from the buddy such that we
cannot allocate them to not trigger MCEs.


offline pages are exposed to the buddy by onlining them
(generic_online_page()), which is init+freeing. PageOffline() and
PageHWPoison() are onlined by removing the flag and freeing them to the
buddy.


Your case is different such that the pages are managed by the buddy and
they don't really have online/offline semantics compared to what we
already have. All the buddy has to do is prepare them for initial use.


I'm fine with reusing PageOffline(), but for the purpose of reading the
code, I think we really want some different terminology in page_alloc.c

So using any such terminology would make it clearer to me:
* PageBuddyUnprepared()
* PageBuddyUninitialized()
* PageBuddyUnprocessed()
* PageBuddyUnready()


> 
> What if I change accept->online in function names and document the meaning
> properly?
> 
>> I assume PageOffline() will be set only on the first sub-page of a
>> high-order PageBuddy() page, correct?
>>
>> Then we'll have to monitor all PageOffline() users such that they can
>> actually deal with PageBuddy() pages spanning *multiple* base pages for
>> a PageBuddy() page. For now it's clear that if a page is PageOffline(),
>> it cannot be PageBuddy() and cannot span more than one base page.
> 
>> E.g., fs/proc/kcore.c:read_kcore() assumes that PageOffline() is set on
>> individual base pages.
> 
> Right, pages that offline from hotplug POV are never on page allocator's
> free lists, so it cannot ever step on them.
> 


-- 
Thanks,

David / dhildenb

