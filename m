Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44823C1E
	for <linux-coco@lists.linux.dev>; Sat, 28 Oct 2023 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GNY6kXNB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NEQPzWuS"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698502331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWAt/PDpViqk3UG1Vk3j+0hCIjdKt4J31sr7CYkEEWA=;
	b=GNY6kXNByQkJQe/0Dk5K7kRNpz+qZa+bZR68lQGT6vUrL6kSjnnLbImYBXOqP0+ueebAV5
	gsOQnMx6lkcBlUOk5IT2YamImtiO1APlalzZHJb7nCgHJbGRroY5GgrTDgJEgicUztWpYp
	sx/61YRKSiSjjnTSsDQXfheFy+KmeSW5n3Xn9puHFQrJxRgR4rMTXUBSH9i39JW5b5wNeU
	QfgBJBA59dmshNBvyqWdkucR5TF11vFr+1+9PGyQF+8R0Dn+2ul24BKCsRGwvgVf0OH5Yn
	gkJUEjymQKTw+WeNpfZpK0AC6UntzEXXvF1oOc+rX6bU1ajxc2t8qK0QAB5Okg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698502331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CWAt/PDpViqk3UG1Vk3j+0hCIjdKt4J31sr7CYkEEWA=;
	b=NEQPzWuSx4qqzS4AYxdB3fJkAE2b0tT66TOWNyVlzvm+ClVFz5ErrXG/mXZmfIFd/FbOHY
	sNPgaHg8ASI15CBw==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, "Huang,
 Kai" <kai.huang@intel.com>, Baoquan He <bhe@redhat.com>,
 kexec@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCHv2 02/13] kernel/cpu: Add support for declaring CPU
 offlining not supported
In-Reply-To: <20231020151242.1814-3-kirill.shutemov@linux.intel.com>
References: <20231020151242.1814-1-kirill.shutemov@linux.intel.com>
 <20231020151242.1814-3-kirill.shutemov@linux.intel.com>
Date: Sat, 28 Oct 2023 16:12:10 +0200
Message-ID: <87a5s225vp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 20 2023 at 18:12, Kirill A. Shutemov wrote:

Subject: cpu/hotplug: ...

> ACPI MADT doesn't allow to offline CPU after it got woke up.

ACPI MADT is a table ...

This is about the MADT mailbox wakeup method, right?

> Currently offlining hotplug prevented based on the confidential

is prevented

> computing attribute which is set for Intel TDX. But TDX is not
> the only possible user of the wake up method.
>
> Introduce cpu_hotplug_not_supported() that can be called to indicate
> that CPU offlining should be disabled.

Otherwise the changes look good!
