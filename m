Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECD347D4
	for <linux-coco@lists.linux.dev>; Mon,  9 Oct 2023 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2857Uy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696860814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtAr6vMHSkU1o8N9xFJERXPEAH/eUDbPVOnY1/d3q0M=;
	b=h2857Uy6HXgDGJ9vpppo3gVSOFtVQQ7xNSm4kZl/Tx5RcxM/RsRXIqZPzgdBWINwbY5ssH
	c4M1UDS2QyE8qIV3uhvE5CzWXhHe2vOKPJlkoc548Q1Kbqwt7GDVNs1H6YcqM3ViIA9Dez
	PmRH4BJ5zdgllBruQm51Fqw9JrQXdFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-1ORgyTEpN9-o7KLkB5trKw-1; Mon, 09 Oct 2023 10:13:15 -0400
X-MC-Unique: 1ORgyTEpN9-o7KLkB5trKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD5881D787;
	Mon,  9 Oct 2023 14:13:14 +0000 (UTC)
Received: from localhost (unknown [10.72.112.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1498240C6EBF;
	Mon,  9 Oct 2023 14:13:13 +0000 (UTC)
Date: Mon, 9 Oct 2023 22:13:10 +0800
From: Baoquan He <bhe@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] x86/tdx: Add kexec support
Message-ID: <ZSQKdrP9VE96eDxg@MiWiFi-R3L-srv>
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <ZSNADxBZEDyxEnZ4@MiWiFi-R3L-srv>
 <20231009133655.3aqi4kwx7wtqgqtm@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009133655.3aqi4kwx7wtqgqtm@box.shutemov.name>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

On 10/09/23 at 04:36pm, Kirill A. Shutemov wrote:
> On Mon, Oct 09, 2023 at 07:49:35AM +0800, Baoquan He wrote:
> > On 10/05/23 at 04:13pm, Kirill A. Shutemov wrote:
> > > The patchset adds bits and pieces to get kexec (and crashkernel) work on
> > > TDX guest.
> > > 
> > > They bring kexec support to the point when we can start the new kernel,
> > > but it will only be able to use single CPU. It should be enough to cover
> > > the most common case: crashkernel.
> > 
> > Not sure if this question has been raised and answered in the past. Please
> > forgive my bad memory if it has. The one cpu is fine to kdump kernel most
> > of time, while we enable all CPUs by default when kexec rebooting. And kdump
> > kernel with multiple cpu is allowed too. Wondering if there's plan to
> > support the multiple cpu on TDX in the future.
> 
> Sorry, I didn't update this part of cover letter properly, but the last
> patch of the patchset makes possible to kexec with multiple CPUs and the
> 2nd kernel will see them all. It requires support on BIOS side, otherwise
> we fallback to single CPU kexec.

Oops, I didn't read them carefully. You have mentioned that in the last
paragraph of cover letter. That's a great news, thanks.

