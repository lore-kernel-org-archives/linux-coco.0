Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524363FC5
	for <linux-coco@lists.linux.dev>; Wed, 15 Sep 2021 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631720145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLB4RIdMUuayuQDxk1drvnDwcRCYgf6RZ3NglDIohcw=;
	b=T0D9J7QxrQt7dA278sa3XHmvg9thuMJTlSPWlHQqIeuGX68+nwyv6V0IbgMCwQ91BF/Z88
	GE4NDs7jKq87VaTRjZmQCNLraGnYNnjb12tCrcgaTln6+jiijpTDZ0pv78a/Eh+4Ihv2Mr
	imn+3BQQogpXBi18GetOqLPYZh7sFQM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-PV9NclIKPku-HZ5ePbWLBA-1; Wed, 15 Sep 2021 11:35:44 -0400
X-MC-Unique: PV9NclIKPku-HZ5ePbWLBA-1
Received: by mail-wm1-f70.google.com with SMTP id z18-20020a1c7e120000b02902e69f6fa2e0so1637846wmc.9
        for <linux-coco@lists.linux.dev>; Wed, 15 Sep 2021 08:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hLB4RIdMUuayuQDxk1drvnDwcRCYgf6RZ3NglDIohcw=;
        b=1q/LHDx2U2lFwJAhhiRRW1G3+YLKIL6BqLBDy36AXZCDNvK5RNSjA8LVxBwlD9Ccji
         B/Z1++EhJaUIVTwjJMBt+SzCsXP2vrkCtR6EXvwpRyAqUfR65dXraJyVNZxteZ5opbEq
         27KlKmLzk2QAI7RpgzgpjTpyzGHL/1BTHGXV4LilfITJu+JxoaD5weuyYY0KVGMuzlWM
         AhkWtvQgfJ/1/cW1wLBKPRdcZy3DrhqUD6N0JGUxWLdg9mKo0cx7GU2gDHcqxoZZRuyK
         vM1oSKTy2iSbrZJfcOexTdWP5krRqO9DUSDr7Mam+HayQoWtPDTgNrQsi36rBD0F2TAL
         kdBQ==
X-Gm-Message-State: AOAM533+ZAiCP9m7X2c+Lr0a/eTCKzy2Gzngd7Us1c00lmHwQlTd8Ap2
	jUJazfYlvIE02flVYZtwe0ryIQ3ky9fwSDnkFLcBJQ7IYzN5rBTS+MRmN6KSHGTf+b6JLwTzVLK
	9VMEutVP0bfQCc6RZr4XZPA==
X-Received: by 2002:a5d:66d1:: with SMTP id k17mr681531wrw.200.1631720142823;
        Wed, 15 Sep 2021 08:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5OWqaCDbnfPfYJivbWZX/tz0dw8poxVVs/OqIyOZE0YLU2lOPz/RKZDjKDqWUdl51wuaSBw==
X-Received: by 2002:a5d:66d1:: with SMTP id k17mr681496wrw.200.1631720142598;
        Wed, 15 Sep 2021 08:35:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6426.dip0.t-ipconnect.de. [91.12.100.38])
        by smtp.gmail.com with ESMTPSA id h8sm4462077wmb.35.2021.09.15.08.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 08:35:41 -0700 (PDT)
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
From: David Hildenbrand <david@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Andi Kleen <ak@linux.intel.com>, David Rientjes <rientjes@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <20210902184711.7v65p5lwhpr2pvk7@box.shutemov.name>
 <YTE1GzPimvUB1FOF@google.com>
 <20210903191414.g7tfzsbzc7tpkx37@box.shutemov.name>
 <02806f62-8820-d5f9-779c-15c0e9cd0e85@kernel.org>
 <20210910171811.xl3lms6xoj3kx223@box.shutemov.name>
 <20210915195857.GA52522@chaop.bj.intel.com>
 <51a6f74f-6c05-74b9-3fd7-b7cd900fb8cc@redhat.com>
 <20210915142921.bxxsap6xktkt4bek@black.fi.intel.com>
 <ca80775c-6bcb-f7c2-634b-237bc0ded52a@redhat.com>
Organization: Red Hat
Message-ID: <09caba0b-6b3d-668f-312c-ed870379b669@redhat.com>
Date: Wed, 15 Sep 2021 17:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ca80775c-6bcb-f7c2-634b-237bc0ded52a@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>>
>>> who will actually do some kind of gfn-epfn etc. mapping, how we'll
>>> forbid access to this memory e.g., via /proc/kcore or when dumping memory
>>
>> It's not aimed to prevent root to shoot into his leg. Root do root.
> 
> IMHO being root is not an excuse to read some random file (actually used
> in production environments) to result in the machine crashing. Not
> acceptable for distributions.
I just realized that reading encrypted memory should be ok and only 
writing is an issue, right?


-- 
Thanks,

David / dhildenb

