Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057A3FC3
	for <linux-coco@lists.linux.dev>; Fri, 27 Aug 2021 22:28:59 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id q3so4819555plx.4
        for <linux-coco@lists.linux.dev>; Fri, 27 Aug 2021 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kcz/OcOk78cxC9xSl0rIRLhu0Wg6VNLvHKoD96Y0zU4=;
        b=JSfG3SMSCC9NBv4yyAkJXKMCG8K50uUZ9UT0zpseTaWzxZqw7s2EkKqGCUkqY2hEEO
         rTAN5Wi3ymSOi052g5pSN+AYYo2jhO/xEnmmSqM83ebsws8hkJXfqzXn5hmRkEaeRHXA
         tzfo43wq7M4o16hRkaVL/5ait942tSAHvDNMqYnAkg3QXfq71LkI6xV86h9PyzZVVcpn
         p09Z7AznbqxQrUlt77vweBgDktY/D8IaBnrWZqY7Gz1E22yuuoHGV/Ci1ICTIEHARo7U
         xZOjtz78b+ZRmwN2VCOjYpDOISpwNFmKomLi7QW8XakSn7tWhLJ9jAeWAYvJiBwm7wMb
         T5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kcz/OcOk78cxC9xSl0rIRLhu0Wg6VNLvHKoD96Y0zU4=;
        b=PIs7AmR47f/Lw0BWdimHsy1vXloe8YJfhD8qxmdLmL4zhWzoAJqojlba5SiEvW+kup
         dBP46+iguPvD/gc2/2ZKwhXr1mfmKpKA1s9tquvbRnrX3dtS0KbCU06oyRMWW0A+22NP
         BoEuQWr+DRRipPj0838qp+3o8mbSSLh1BMf1HZEDeQ0U0no27wS70Q7iIdXuS4+JytqY
         m/uR+LD/P1zIH1rqUZ3TEthLUpwXj9MY9vDoAVXx9Qc/Z5cPpdnLMAWH/77OCTjVvs+4
         f4DyWVcI9h2vJWkwzMbVmz75FmGwSxaUb3eDSEzynGT1NeBSgL+A8HXNnz5mfkayEkqw
         lXMw==
X-Gm-Message-State: AOAM531vZm+ILZV/OOIMAcUbuUVl19Lqf72aF/ENq6tVp/wI5YNkKCq+
	qXNWTb4OvuXsNWLFbZluQn3aAA==
X-Google-Smtp-Source: ABdhPJxkNLsbF9Xpeyfdy+wpf433FXdU+W+o0pck9+d5DrE9KJ2PeRK+v2c385q0qdLbxd5O5brffg==
X-Received: by 2002:a17:90a:1957:: with SMTP id 23mr12592991pjh.141.1630103339086;
        Fri, 27 Aug 2021 15:28:59 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id a23sm2263182pfo.120.2021.08.27.15.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 15:28:58 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:28:54 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	kvm list <kvm@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
	linux-coco@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest
 private memory
Message-ID: <YSlnJpWh8fdpddTA@google.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
 <40af9d25-c854-8846-fdab-13fe70b3b279@kernel.org>
 <cfe75e39-5927-c02a-b8bc-4de026bb7b3b@redhat.com>
 <73319f3c-6f5e-4f39-a678-7be5fddd55f2@www.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73319f3c-6f5e-4f39-a678-7be5fddd55f2@www.fastmail.com>

On Fri, Aug 27, 2021, Andy Lutomirski wrote:
> 
> On Thu, Aug 26, 2021, at 2:26 PM, David Hildenbrand wrote:
> > On 26.08.21 19:05, Andy Lutomirski wrote:
> 
> > > Oof.  That's quite a requirement.  What's the point of the VMA once all
> > > this is done?
> > 
> > You can keep using things like mbind(), madvise(), ... and the GUP code 
> > with a special flag might mostly just do what you want. You won't have 
> > to reinvent too many wheels on the page fault logic side at least.

Ya, Kirill's RFC more or less proved a special GUP flag would indeed Just Work.
However, the KVM page fault side of things would require only a handful of small
changes to send private memslots down a different path.  Compared to the rest of
the enabling, it's quite minor.

The counter to that is other KVM architectures would need to learn how to use the
new APIs, though I suspect that there will be a fair bit of arch enabling regardless
of what route we take.

> You can keep calling the functions.  The implementations working is a
> different story: you can't just unmap (pte_numa-style or otherwise) a private
> guest page to quiesce it, move it with memcpy(), and then fault it back in.

Ya, I brought this up in my earlier reply.  Even the initial implementation (without
real NUMA support) would likely be painful, e.g. the KVM TDX RFC/PoC adds dedicated
logic in KVM to handle the case where NUMA balancing zaps a _pinned_ page and then
KVM fault in the same pfn.  It's not thaaat ugly, but it's arguably more invasive
to KVM's page fault flows than a new fd-based private memslot scheme.
