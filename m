Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3728314A0B8
	for <linux-coco@lists.linux.dev>; Thu, 14 Nov 2024 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602163; cv=none; b=TWFMQUlfKJcVuLFWcDYxlqBjGHwLdTD9y9h1uEphm3RceWQF7x1hCqtQ7FqEqhWWtqSSE1hx2ZqQBTVMkMVdzU8oCFVwiLt+IKiU963p+K6ikEjW7P3NuAVVlax9Oags8N0Z0/1mDnX+UfZMDS4HuFZ3+by5QSC9kOI4++hVCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602163; c=relaxed/simple;
	bh=M5BnZB1kJ7cQtkKYzt7rwZX9F+U1UeZ/mLgvO5CK9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFD3j6hot/OuO0qgV+OWKrZyuzzoE9WAfetxR1ocrxgDW/lwEgVpanEPvx1ngnrCe/mHOHmyh4zGQ4oE76aijLF4J05KeH2SEXkArPIK3WHLQcDmfCqeAx9g3pY0QM3e2a9k2cRzmXVkg+n9rOn0vuyN1LPD2eedITdtD5rBu78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fe0AcpUt; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fe0AcpUt"
Date: Thu, 14 Nov 2024 08:35:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731602159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4W3MD+2+H34NJko5UUHRsSLZXY5AfOPI5DGoExeqoI=;
	b=Fe0AcpUtSS8r4YqpfxDAgC1LJa03Ra7Hs0/ZOSNVEU/6LFdsJ/oeq6du6vCXVmw8oEEFav
	4AtM4/nQa135DCcXzH9PtqyORzaZbEndePQ/PkViMWq2HxOpyOszzH3zYwRcmPkFXd5o/L
	va8+AVdhdkQmwcIsIYOZNQmFGqlFt60=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dionna Glaze <dionnaglaze@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tianfei zhang <tianfei.zhang@intel.com>, linux-coco@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Michael Roth <michael.roth@amd.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Russ Weight <russell.h.weight@intel.com>
Subject: Re: [PATCH v6 3/8] firmware_loader: Move module refcounts to allow
 unloading
Message-ID: <20241114163546.ermxem4bgjzeaxzc@4VRSMR2-DT.corp.robot.car>
References: <20241112232253.3379178-1-dionnaglaze@google.com>
 <20241112232253.3379178-4-dionnaglaze@google.com>
 <6734119c1c9a7_10bb729471@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6734119c1c9a7_10bb729471@dwillia2-xfh.jf.intel.com.notmuch>
X-Migadu-Flow: FLOW_OUT


On Tue, Nov 12, 2024 at 06:40:28PM -0800, Dan Williams wrote:
> Dionna Glaze wrote:
> > If a kernel module registers a firmware upload API ops set, then it's
> > unable to be moved due to effectively a cyclic reference that the module
> > depends on the upload which depends on the module.
> > 
> > Instead, only require the try_module_get when an upload is requested to
> > disallow unloading a module only while the upload is in progress.
> 
> Oh, interesting, I wondered why CXL did not uncover this loop in its
> usage only to realize that CXL calls firmware registration from the
> cxl_pci module, but the @module paramter passed to
> firmware_upload_register() is the cxl_core module. I.e. we are
> accidentally avoiding the problem. I assume other CONFIG_FW_UPLOAD users
> simply do not test module removal.
> 
> However, I think the fix is simply to remove all module reference taking
> by the firmware_loader core. It is the consumer's responsibility to call
> firmware_upload_unregister() in its module removal path and that should
> flush any and all future usage of the passed in ops structure.

As I understand it, if a module directly references symbols in another 
module, then the reference count is automatically incremented to ensure
that the dependent symbols are available to the consumer.

In this case, the firmware_loader does not directly reference symbol
names in the device driver that registered it. The call-back function
pointers are provided during registration. Without explicitly
incrementing the module reference count, it is possible to remove the
device driver while leaving the firmware loader instance (and sysfs
entries) intact. Accessing those sysfs nodes would result in
references to pointers that are no longer valid.

Clearly this would be an unexpected/unusual case. Someone with root
access would have to remove the device driver. I'm not sure how much
effort should be expended in preventing it - but this is the reasoning
behind the incrementing/decrementing of the module reference counts.

- Russ
