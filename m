Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278372
	for <linux-coco@lists.linux.dev>; Wed,  1 Sep 2021 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630518834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiGBsFuqRCBAADb2SjkWOZz2ABAMuafv28YaxO7HPu8=;
	b=Y+EqcuQoQDB9DHPb4hvPP3kknmNJ/60ZTTPELczR1dwcTt2BvmeOmXz1ViyggnzL/kL9c7
	58wo+f5S+EDs7YEePWxmfM+N2oLLnu+s3IYsPDBGWRo5mZ1IIJL04CCHwVxfOgFHYphOLO
	fIWEoo8S5Le/PvuOzQyGQNB07jAmewI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-E3vBgpbUMIOb7rlGqDXt7A-1; Wed, 01 Sep 2021 13:53:53 -0400
X-MC-Unique: E3vBgpbUMIOb7rlGqDXt7A-1
Received: by mail-wm1-f70.google.com with SMTP id u14-20020a7bcb0e0000b0290248831d46e4so110182wmj.6
        for <linux-coco@lists.linux.dev>; Wed, 01 Sep 2021 10:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GiGBsFuqRCBAADb2SjkWOZz2ABAMuafv28YaxO7HPu8=;
        b=L5cIZ2q64YzcDZA4xa69MJibNknFIhkyvuoP3xj8rzp8DpAEr2nb8xERVdxFpQY4/w
         5WslEXVcrDDE/0yVX/mC5sI2JN1bS6GdDooaiKlercmluGf8a4tvtl0truomaYZLyiJB
         yKsf2vTEn69hI7w0LIHOCut7S+A59pEKlf+6v6k/9zVA/E4e8SMgnbR8TDwUrlYBWZcz
         mcdxLgmU8tupzjlQTwSEGobGXiP4DrMAABtvtTAjLwx38xm5jk8spkz/Z72cp9gwuXKV
         TrZXzAxjz8f4EVEKTT2tQsg2QnyRklE7p2Ngs4PBtOQOQDfOi0CFCEi8nub/Uv9nR5Ue
         RARg==
X-Gm-Message-State: AOAM532jHgqM0gqJ2vaUdeAugoHStadyK0wfXM9FyFfiANRNFXOa6C91
	WZt3/FTBRTwoQ3ZXFqjy/7AlObwCBP3gBEoCDut0W/5Ev51ilZ1hJ68SYRFfhFafdKK5YNhB09K
	3eLPlgLqTw/4+vnMUA8o/qg==
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr717794wmg.153.1630518832802;
        Wed, 01 Sep 2021 10:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzId1EJQWuCXd4wDXaMAQVTM5bqXfZadYfJq5hfT4+k85e5baXrLRntNgIiFg9LFycxTroBXw==
X-Received: by 2002:a1c:20d7:: with SMTP id g206mr717764wmg.153.1630518832630;
        Wed, 01 Sep 2021 10:53:52 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
        by smtp.gmail.com with ESMTPSA id r10sm127194wrc.85.2021.09.01.10.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 10:53:52 -0700 (PDT)
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
To: Sean Christopherson <seanjc@google.com>
Cc: jejb@linux.ibm.com, Andy Lutomirski <luto@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>
References: <61ea53ce-2ba7-70cc-950d-ca128bcb29c5@redhat.com>
 <YS6lIg6kjNPI1EgF@google.com>
 <f413cc20-66fc-cf1e-47ab-b8f099c89583@redhat.com>
 <9ec3636a-6434-4c98-9d8d-addc82858c41@www.fastmail.com>
 <bd22ef54224d15ee89130728c408f70da0516eaa.camel@linux.ibm.com>
 <a259e10d-39c9-c4a5-0ab4-f42a1b9bfaee@redhat.com>
 <0d6b2a7e22f5e27e03abc21795124ccd66655966.camel@linux.ibm.com>
 <1a4a1548-7e14-c2b4-e210-cc60a2895acd@redhat.com>
 <4b863492fd33dce28a3a61662d649987b7d5066d.camel@linux.ibm.com>
 <214ca837-3102-d6d1-764e-6b4cd1bab368@redhat.com>
 <YS+9VHzC0XQF/9NK@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3b63a5d9-30e4-2ae8-2f01-a92b758e81de@redhat.com>
Date: Wed, 1 Sep 2021 19:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YS+9VHzC0XQF/9NK@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.09.21 19:50, Sean Christopherson wrote:
> On Wed, Sep 01, 2021, David Hildenbrand wrote:
>>>>> Well not necessarily, but it depends how clever we want to get.  If
>>>>> you look over on the OVMF/edk2 list, there's a proposal to do guest
>>>>> migration via a mirror VM that invokes a co-routine embedded in the
>>>>> OVMF binary:
>>>>
>>>> Yes, I heard of that. "Interesting" design.
>>>
>>> Heh, well what other suggestion do you have?  The problem is there
>>> needs to be code somewhere to perform some operations that's trusted by
>>> both the guest and the host.  The only element for a confidential VM
>>> that has this shared trust is the OVMF firmware, so it seems logical to
>>> use it.
>>
>> <offtopic>
>>
>> Let me put it this way: I worked with another architecture that doesn't
>> fault on access of a secure page, but instead automatically exports/encrypts
> 
> I thought s390 does fault on insecure accesses to secure pages, and it's the
> kernel's fault handler that "automatically" converts the page?  E.g. trap 0x3d
> -> do_secure_storage_access() -> arch_make_page_accessible().

"automatic" as in "the kernel can do it easily automatically under the 
hood when accessing such memory", yes that's what I meant :)

-- 
Thanks,

David / dhildenb

