Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C6811
	for <linux-coco@lists.linux.dev>; Tue, 26 Jul 2022 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658845860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gr7dw0e3vkHCOc9kW8UEU5CieYdDfZtmZu7Qeg3pxlU=;
	b=cvrR5GIn8DgNAJxePWXnBUMEtjcvhO4ZKiYprt1tOyG0b5gQyLOWHfVFQ/hb5P3JXYNPBL
	wbgHvuUzLq9vboYv6FlJvFCuSl2rmy7GC1MEhJd5f6zFiYKrahrI4NYSHbmeRnSdcQLWQ8
	Q4Mtz8fU5ALtCjmabmKsFyjFM0Kg1q8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-fcfz9HW6N76ML4nyTdZW5w-1; Tue, 26 Jul 2022 10:30:59 -0400
X-MC-Unique: fcfz9HW6N76ML4nyTdZW5w-1
Received: by mail-wm1-f70.google.com with SMTP id z11-20020a05600c0a0b00b003a043991610so5458724wmp.8
        for <linux-coco@lists.linux.dev>; Tue, 26 Jul 2022 07:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=gr7dw0e3vkHCOc9kW8UEU5CieYdDfZtmZu7Qeg3pxlU=;
        b=VDsXeVuynyJK4UFkwdzQ9HijK2nY5WCwYu7r0tgEvch//QiUmKl8SL+I9hh9IkSaWZ
         4d5d3qLALQAdi9IqKtYpcw1QKUhsIA44NIC+14NmJUAIDkKoO6V8LveWgclWOAoyqsBb
         QwpN8CnuXkZnAx8ibsXYsniFE+2Nf7riBBz/fFG+HUC6f+Y3ez5cerA5CwAXXCtrpUbl
         S40Agm03UWi1TDUfJEShkUTXcl59DPD66vUeU5Kq34nk8L+3rIyDTw8Lqvpeyt/aPLFF
         kdE/4r+7o1aTONPX42Kd66Cq/p9AppEhciG14c3Bn9RSl4+vUPHgGiZchp/C5OFdjb0K
         D2eA==
X-Gm-Message-State: AJIora8PBM2zkz1HFpLdbE5gjrlBFcH3UNl4+niDm+mOE17kfec7zcgA
	IZtGMGTBvQ+X4nifVQplv9bfAlRWNbi0wldb7bjpmSDVvU0+ut2Xn0n0l4vL9WK0YYocbxuSUbW
	RKIV9ZVMv2r3CRhl3mHStlA==
X-Received: by 2002:a7b:c3cc:0:b0:3a3:8ec:d69 with SMTP id t12-20020a7bc3cc000000b003a308ec0d69mr25694602wmj.78.1658845857807;
        Tue, 26 Jul 2022 07:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v8k0/X43EXk3DBk+CZ8uyrXpNOynm2gCY+Qrl/OkI5JufZYaMneweAdNpBJGa8v5GHTMBxdg==
X-Received: by 2002:a7b:c3cc:0:b0:3a3:8ec:d69 with SMTP id t12-20020a7bc3cc000000b003a308ec0d69mr25694552wmj.78.1658845857423;
        Tue, 26 Jul 2022 07:30:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:fe00:8ba4:5871:abc3:8a75? (p200300cbc708fe008ba45871abc38a75.dip0.t-ipconnect.de. [2003:cb:c708:fe00:8ba4:5871:abc3:8a75])
        by smtp.gmail.com with ESMTPSA id v11-20020adfe4cb000000b0021e6b62fde2sm10429441wrm.59.2022.07.26.07.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 07:30:57 -0700 (PDT)
Message-ID: <fb58de71-a255-364b-5d32-1c839ed4a5c2@redhat.com>
Date: Tue, 26 Jul 2022 16:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, marcelo.cerri@canonical.com,
 tim.gardner@canonical.com, khalid.elmously@canonical.com,
 philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com>
 <YtltYRuL+2uQkYUK@zn.tnic> <ebcf2979-45fc-8d41-cc28-ac8da0d24245@intel.com>
 <Ytr4FCV2xPGUBLqs@zn.tnic> <707ca113-c2a2-8fe2-a22c-5be13adc7bb4@intel.com>
 <Yt6LOD9Ae2NqyG1N@zn.tnic> <7d664831-a78c-4a4f-5bd6-f0e04463ca7c@redhat.com>
 <Yt6SL8+nr1ESSZDh@zn.tnic>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Yt6SL8+nr1ESSZDh@zn.tnic>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.22 14:53, Borislav Petkov wrote:
> On Mon, Jul 25, 2022 at 02:38:57PM +0200, David Hildenbrand wrote:
>> The less core-MM code to handle unaccepted memory the better. Meaning,
>> that any kind of additional pre-acceptance (in addition to what we have
>> here) needs good justification.
> 
> I actually mean to have a user interface to have the core code
> pre-accept. I.e., interface to what will be already there anyway.
>

Ah, got it. The "issue" with ordinary prefaulting in user space is that
you'll also end up zeroing the memory. But yeah, it should just accept a
bunch of memory.

> Or is that frowned upon too?

I was assuming you'd want some additional interface that only accept
memory without actually temporarily allocating it.

-- 
Thanks,

David / dhildenb

