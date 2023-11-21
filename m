Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF1738F81
	for <linux-coco@lists.linux.dev>; Tue, 21 Nov 2023 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Byp77lY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700571012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROag+VmLCtyBTs9acg1WAJvLy3sMpjYtnMNYFyigFHQ=;
	b=Byp77lY+g+KjApvyyVRSlAc0do5YWKiTBkDu7ITus53l6gqVQ3st5ADlFeBlSqcz6gIpX1
	QyjWBdRaDDd/yhPABnc45YJHbC4UCt5CDbK5UN39gfahgBcLyBObpR9DRxPO+t8RLRxb30
	FdGVYdevLVb+i7z+mDpCRB0/2zI1sik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-5cWuSWm2Ox2TstUXPkD42g-1; Tue, 21 Nov 2023 07:50:08 -0500
X-MC-Unique: 5cWuSWm2Ox2TstUXPkD42g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DA19852AC8;
	Tue, 21 Nov 2023 12:50:07 +0000 (UTC)
Received: from localhost (unknown [10.72.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70282492BE0;
	Tue, 21 Nov 2023 12:50:06 +0000 (UTC)
Date: Tue, 21 Nov 2023 20:50:03 +0800
From: Baoquan He <bhe@redhat.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	ltao@redhat.com, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Kalra, Ashish" <ashish.kalra@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	"Huang, Kai" <kai.huang@intel.com>, kexec@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 00/14] x86/tdx: Add kexec support
Message-ID: <ZVyne10VpRR1Kpkk@MiWiFi-R3L-srv>
References: <20231116125612.daxettqcapled7ac@box.shutemov.name>
 <ZVYkdI74X8acDtTq@MiWiFi-R3L-srv>
 <ZVYrA+Ks0DGFo/0p@MiWiFi-R3L-srv>
 <20231117124748.umfuc3no2qvh4shj@box.shutemov.name>
 <ZVeApN4lDqTLu7ma@MiWiFi-R3L-srv>
 <20231117154632.zvi6g6lblmtvikzt@box>
 <ZVxRBLsQcv8KRasA@MiWiFi-R3L-srv>
 <20231121084321.t44ntae5ohslgrme@box.shutemov.name>
 <ZVyDMTrbPwe/0yRd@MiWiFi-R3L-srv>
 <20231121104011.jfe6fzmxgl7onlfi@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121104011.jfe6fzmxgl7onlfi@box.shutemov.name>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On 11/21/23 at 01:40pm, Kirill A. Shutemov wrote:
> On Tue, Nov 21, 2023 at 06:15:13PM +0800, Baoquan He wrote:
> > > > 2) anything missing to allow makedumpfile/cp access 1st kernel's memory?
> > > 
> > > It worked before for us, but I have not checked for a while.
> > > 
> > > I expected you've dropped my "if (crash) return;" debug patch I asked you
> > > to tested before, right? If not, failure is expected.
> > 
> > Ah, my bad. I didn't actually.
> > 
> > Just now I rebuilt kernel and retested, vmcore saving works. Just when
> > it finished kdump work and tried to reboot, the rebooting failed because
> > cpus are not resettable like kexec reboot does. Not sure if this is seen
> > in your test.
> 
> Yes. It is the same reboot limitation I've mentioned before.

I see, thanks.

