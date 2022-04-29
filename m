Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8487B
	for <linux-coco@lists.linux.dev>; Fri, 29 Apr 2022 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651237873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQ+nnU9b+AK9j8XZkLHMkU6d8KFt4vZ+1q0g2FKJ16w=;
	b=MTV3jr7JLVCQsPpQ/R7dFKEejzXTXt1xgvRQ80Dv/K1H4MwZQkaVZ585+E7Mj3TeaiP3IV
	dqbCarY1wOwo5jSVBXPT0UT7LThRKjd9SHjxlaimNd3gjZwIaHcHYvgkbrdD61XNDOW0oS
	HGtw4hjFzskPwq4ggog0KxTtJ2vnuC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-vtfQNIQqO66r_fu8YkYLGQ-1; Fri, 29 Apr 2022 09:11:06 -0400
X-MC-Unique: vtfQNIQqO66r_fu8YkYLGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 369B485A5A8;
	Fri, 29 Apr 2022 13:11:05 +0000 (UTC)
Received: from fedora (unknown [10.22.16.76])
	by smtp.corp.redhat.com (Postfix) with SMTP id F0C7E43F704;
	Fri, 29 Apr 2022 13:10:59 +0000 (UTC)
Date: Fri, 29 Apr 2022 10:10:58 -0300
From: Wander Lairson Costa <wander@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 06/12] x86/boot/compressed: Handle unaccepted memory
Message-ID: <Ymvj4ssnzrf74tHl@fedora>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-7-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425033934.68551-7-kirill.shutemov@linux.intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

On Mon, Apr 25, 2022 at 06:39:28AM +0300, Kirill A. Shutemov wrote:
> The firmware will pre-accept the memory used to run the stub. But, the
> stub is responsible for accepting the memory into which it decompresses
> the main kernel. Accept memory just before decompression starts.
> 
> The stub is also responsible for choosing a physical address in which to
> place the decompressed kernel image. The KASLR mechanism will randomize
> this physical address. Since the unaccepted memory region is relatively
> small, KASLR would be quite ineffective if it only used the pre-accepted
> area (EFI_CONVENTIONAL_MEMORY). Ensure that KASLR randomizes among the
> entire physical address space by also including EFI_UNACCEPTED_MEMOR

nit: s/EFI_UNACCEPTED_MEMOR/EFI_UNACCEPTED_MEMORY./

[snip]

