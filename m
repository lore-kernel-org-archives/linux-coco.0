Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7343FD0
	for <linux-coco@lists.linux.dev>; Thu, 16 Sep 2021 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631784250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0dHlztnaiRHcaPy45MsGDKnkv/q5nQ+if9oZqgd4ekg=;
	b=RlRtXQeKTQUM7vXPSng8fIHR/ERLFa9WEoiCay4mfWAWcfrjUFeNjxFt2mjL6iZRGn96Ee
	SkTwyf/rlVVQ8IXvxj+YIvMDeCbQweRy426jAD+aaEKRZ3JlyVvslOMe4z7X+V2pY9p7dl
	pTlWiKkxg+Q+iFgcC9LEBNpVqLUYy0o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-lapP3Wv6MFi6hLAmHKK4VQ-1; Thu, 16 Sep 2021 05:24:09 -0400
X-MC-Unique: lapP3Wv6MFi6hLAmHKK4VQ-1
Received: by mail-ed1-f72.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923so3857129edn.5
        for <linux-coco@lists.linux.dev>; Thu, 16 Sep 2021 02:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0dHlztnaiRHcaPy45MsGDKnkv/q5nQ+if9oZqgd4ekg=;
        b=CsVWjE6c2vnzAlhKMyfNLSC/l3iWfExowKQ8SqKT//IB6gRRozIpvJufoAw4bAcVfK
         mkt5R+ty/dpwVANO+9i2VhkXEVM0QMyt3KTW7NZp1T1nuAvWzS6B8WYtDOVxqHgBNRX9
         crlkLesysnqzgqAZtGy+IzwxfIpQb+goMBN5fz/mRfe5XUCVvUSX5Qq4+kXwNP5rTT/f
         wEhbSW+Jb1q2K5OCXiVlyymZ/x7VOiG1495o6cBG/9GybJGgX6tnlXBds7RBkaELXET0
         Gr7fOUpg659Cju+Ug99QXMfQMR8gjv6DNgZND+cWZPuWvQb1Om9mnb22IHlIHkCcjoO7
         KHnQ==
X-Gm-Message-State: AOAM530zT4kEl+FjWgLoehoEtHJwImiiGCW0VdEjrVXww3ydB8X0vsJK
	DaAk93XFZ50YP7LO3Dm51TBIka2CQOwD3paQp9PAYmpFoHLxmY86K/9faR+AY44mc2P5kX65BP4
	0lKxU22mRXXsypYHOf6yY3Q==
X-Received: by 2002:a17:907:2653:: with SMTP id ar19mr5092591ejc.431.1631784248157;
        Thu, 16 Sep 2021 02:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxSCHk9AOfST+otT+0wr2XQnUZQCly3Lf1LowqYXIayIW1WAv+zy/RvKF5ZgnYhDlPWePO4Q==
X-Received: by 2002:a17:907:2653:: with SMTP id ar19mr5092579ejc.431.1631784247943;
        Thu, 16 Sep 2021 02:24:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id n10sm954257ejk.86.2021.09.16.02.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 02:24:07 -0700 (PDT)
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
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
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@intel.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <20210902184711.7v65p5lwhpr2pvk7@box.shutemov.name>
 <YTE1GzPimvUB1FOF@google.com>
 <20210903191414.g7tfzsbzc7tpkx37@box.shutemov.name>
 <02806f62-8820-d5f9-779c-15c0e9cd0e85@kernel.org>
 <20210910171811.xl3lms6xoj3kx223@box.shutemov.name>
 <20210915195857.GA52522@chaop.bj.intel.com>
 <20210915141147.s4mgtcfv3ber5fnt@black.fi.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
Message-ID: <179fdb45-d8a4-9567-edfe-2168794f599e@redhat.com>
Date: Thu, 16 Sep 2021 11:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210915141147.s4mgtcfv3ber5fnt@black.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15/09/21 16:11, Kirill A. Shutemov wrote:
>> Would introducing memfd_unregister_guest() fix this?
> I considered this, but it get complex quickly.
> 
> At what point it gets called? On KVM memslot destroy?
> 
> What if multiple KVM slot share the same memfd? Add refcount into memfd on
> how many times the owner registered the memfd?

You will always have multiple KVM slots sharing the same memfd, because 
memslots are SRCU-protected.  So there will be multiple generations of 
memslots around and unregistering must be delayed to after 
synchronize_srcu (around the call to kvm_arch_commit_memory_region).

So KVM could just call memfd_{,un}register_guest as many times as it 
calls fdget/fput.  Looking at your test device, it would be like the 
following pseudo-patch:

	case GUEST_MEM_REGISTER: {
		struct fd memfd = fdget(arg);
		memfd_file = memfd.file;
		return memfd_register_guest(memfd_file->f_inode, file,
					    &guest_ops, &guest_mem_ops);
	}
	case GUEST_MEM_UNREGISTER: {
		if (!memfd_file)
			return -EINVAL;

+		memfd_unregister_guest(memfd_file->f_inode, file);
		fput(memfd_file);
		memfd_file = NULL;
		guest_mem_ops = NULL;
		return 0;

and shmem_unregister_guest would be something like

	struct shmem_inode_info *info = SHMEM_I(inode);

	if (WARN_ON_ONCE(info->guest_owner != owner))
		return;
	if (--info->guest_usage_count)
		return;
	info->guest_owner = NULL;
	info->guest_ops = NULL;

Paolo

> It would leave us in strange state: memfd refcount owners (struct KVM) and
> KVM memslot pins the struct file. Weird refcount exchnage program.

