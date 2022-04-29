Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027F7B
	for <linux-coco@lists.linux.dev>; Fri, 29 Apr 2022 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651238385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uC80K2JcwhpHl9wyzV7n0RzilJpR226HPF0HUL7DEq0=;
	b=DOb4WmIICtSjZr/Kb2YmU27KjaDmnSrXZ6MSoLa7X0j8Es36ZsiaqU6ns/p/1U24zdnw3N
	mnjcoLIwt9+679Zhl/heIEgqyhGd4QNALG1dJ5sByf89dE5YnTm3BGIE4O2O5Ztrmc6fDB
	xTsGrjDkYotxv7Y9XMmWrAWjMwzCQJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-vk82ltftOA6cWk439Qv-Jg-1; Fri, 29 Apr 2022 09:19:40 -0400
X-MC-Unique: vk82ltftOA6cWk439Qv-Jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC2F8002B2;
	Fri, 29 Apr 2022 13:19:39 +0000 (UTC)
Received: from fedora (unknown [10.22.16.76])
	by smtp.corp.redhat.com (Postfix) with SMTP id BF50B2166B4D;
	Fri, 29 Apr 2022 13:19:13 +0000 (UTC)
Date: Fri, 29 Apr 2022 10:19:12 -0300
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
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCHv5 07/12] x86/mm: Reserve unaccepted memory bitmap
Message-ID: <Ymvl0N7umDfcjfMb@fedora>
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-8-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425033934.68551-8-kirill.shutemov@linux.intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

On Mon, Apr 25, 2022 at 06:39:29AM +0300, Kirill A. Shutemov wrote:
> A given page of memory can only be accepted once. The kernel has a need
> to accept memory both in the early decompression stage and during normal
> runtime.
> 
> A bitmap used to communicate the acceptance state of each page between the

nit: s/bitmap used/bitmap is used/

[snip]

