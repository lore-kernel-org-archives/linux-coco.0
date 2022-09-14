Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F212F2C
	for <linux-coco@lists.linux.dev>; Wed, 14 Sep 2022 08:05:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id iw17so14380660plb.0
        for <linux-coco@lists.linux.dev>; Wed, 14 Sep 2022 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=BqUhxcUOvv8EZWeVoadoEfAKAvxiKy4DFaV8F/F3nRo=;
        b=Y45pldWaU7msnCMC3mB1XfdqYiXenh8aXHlb6P8wpifZtyvVUiC/Pmw9QwKSxvKaE1
         5vCUZeWVnXL53VuRrWpqC7y1PQSe7vOrfidrlH914Nd9vnCG1aZejYGhPNdsgrnD5Smm
         /VxtyFzzPQwbhCVzigMHS4tQiLksGnaZozE5ratC2Nr12jt2UGbq7KuGY95gkkT5Nr7P
         QlAkTCyt4TIEYQ/FCiD1d6HvKJE59tarY+ga+VyyyjxeDhsob2/t6Uozzfn0gmp2BAea
         2ebCdl6bZD9HrQpesANzLn3iVJ0t6GeI0W0uEcAhhlKoQjbI4C09YKx4Cw7P/AIku5Wn
         77lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=BqUhxcUOvv8EZWeVoadoEfAKAvxiKy4DFaV8F/F3nRo=;
        b=4IByhb6ITf67Yx7KxPXypRzz/fHsWSjbCQTQAa/ge1XCw5BGp+EW5VccMCIDTXSpxj
         5BBn4jmC1MaBZ/vG/smN194TktbhVqEOiNo5DuJxD9IvvFM7HOGR8vmu+Prvsfj7aJtY
         3QDqD6HX8N4LW0YfKIICQ/IY5thNWuolkDvzDvElFEWbAcbqdOtTx39Y9cpCd8Efpdel
         9D9RDRPllr3NYQob+Rx8gRoE9+wqFoxFMAmXRj/2j/WergWmMsndLbenNQl8hVO6dCXU
         JUpQyBCMU0XLecBRisHfEtg6MTQueo8NMhBORTw/qYcw53HoZD5AGmNKMONtF+sPQvqh
         +8+w==
X-Gm-Message-State: ACgBeo3FK9OROy/zn/zyQunvoQiT7kRITWbz/8RBdKsx0cay87544kQo
	r6KRFObzVHMd3RliXeLM/ogFzQ==
X-Google-Smtp-Source: AA6agR4UATq2gDShvsXLljJKEJB7uvGsKLNEqlognTMeRcIxtphBnWCa23O0u7Vyr0cktSSkh1HKog==
X-Received: by 2002:a17:90a:d804:b0:202:f247:91b0 with SMTP id a4-20020a17090ad80400b00202f24791b0mr3530610pjv.8.1663142753759;
        Wed, 14 Sep 2022 01:05:53 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090a6a4800b001fd7e56da4csm8460240pjm.39.2022.09.14.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:05:53 -0700 (PDT)
Date: Wed, 14 Sep 2022 08:05:49 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	jarkko@profian.com
Subject: Re: [PATCH Part2 v5 39/45] KVM: SVM: Introduce ops for the post gfn
 map and unmap
Message-ID: <YyGLXXkFCmxBfu5U@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-40-brijesh.singh@amd.com>
 <YWYm/Gw8PbaAKBF0@google.com>
 <YWc+sRwHxEmcZZxB@google.com>
 <4e41dcff-7c7b-cf36-434a-c7732e7e8ff2@amd.com>
 <YWm3bOFcUSlyZjNb@google.com>
 <20220908212114.sqne7awimfwfztq7@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908212114.sqne7awimfwfztq7@amd.com>

On Thu, Sep 08, 2022, Michael Roth wrote:
> On Fri, Oct 15, 2021 at 05:16:28PM +0000, Sean Christopherson wrote:
> So in the context of this interim solution, we're trying to look for a
> solution that's simple enough that it can be used reliably, without
> introducing too much additional complexity into KVM. There is one
> approach that seems to fit that bill, that Brijesh attempted in an
> earlier version of this series (I'm not sure what exactly was the
> catalyst to changing the approach, as I wasn't really in the loop at
> the time, but AIUI there weren't any showstoppers there, but please
> correct me if I'm missing anything):
> 
>  - if the host is writing to a page that it thinks is supposed to be
>    shared, and the guest switches it to private, we get an RMP fault
>    (actually, we will get a !PRESENT fault, since as of v5 we now
>    remove the mapping from the directmap as part of conversion)
>  - in the host #PF handler, if we see that the page is marked private
>    in the RMP table, simply switch it back to shared
>  - if this was a bug on the part of the host, then the guest will see

As discussed off-list, attempting to fix up RMP violations in the host #PF handler
is not a viable approach.  There was also extensive discussion on-list a while back:

https://lore.kernel.org/all/8a244d34-2b10-4cf8-894a-1bf12b59cf92@www.fastmail.com

> AIUI, this is still sort of an open question, but you noted how nuking
> the directmap without any formalized interface for letting the kernel
> know about it could be problematic down the road, which also sounds
> like the sort of thing more suited for having UPM address at a more
> general level, since there are similar requirements for TDX as well.
> 
> AIUI there are 2 main arguments against splitting the directmap:
>  a) we can't easily rebuild it atm
>  b) things like KSM might still tries to access private pages
> 
> But unmapping also suffers from a), since we still end up splitting the
> directmap unless we remove pages in blocks of 2M.

But for UPM, it's easy to rebuild the direct map since there will be an explicit,
kernel controlled point where the "inaccesible" memfd releases the private page.

> But nothing prevents a guest from switching a single 4K page to private, in
> which case we are forced to split. That would be normal behavior on the part
> of the guest for setting up GHCB pages/etc, so we still end up splitting the
> directmap over time.

The host actually isn't _forced_ to split with UPM.  One option would be to refuse
to split the direct map and instead force userspace to eat the 2mb allocation even
though it only wants to map a single 4kb chunk into the guest.  I don't know that
that's a _good_ option, but it is an option.
