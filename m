Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B92C2FE
	for <linux-coco@lists.linux.dev>; Fri,  1 Sep 2023 19:06:33 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693595191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iOvRrs8LC47Td5buc7O8tH5aMDvXvb/5pEyTYE41830=;
	b=21+p+HQ4yVVCMfRdYG4q9ZQaIb5AqSTgee5OZ6oMZiLI19llY4xylNK3KKPkIOtxftZYaT
	El0BQYah5pa6B4J0PspRXCPM6CdhUnmSwc5e7Y2JQb5KIXSqC/FnyLqRwJJ89n6eBjOxCR
	Da+QQ187nR55LRXG5fDh7i4rg4hskdXRYz4hxSlD1qSVz0c7RakX94EN7wS6S4soUh0ebN
	6yzNdI3tWj+5CM+qd3xofTybIPe2bBULS+euwtmfIzei9tEHWoZRqS3RiFjq/WuMLZCMYV
	IF329GIhYs9+6JBtq1JRGvQMxxSlEZLzPzp8FwgZ5smnWbBGB+AyYCZSexC+bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693595191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iOvRrs8LC47Td5buc7O8tH5aMDvXvb/5pEyTYE41830=;
	b=MKdDuSWC1h802HQ/TlAhAvDNEaK39ASYy+mTuH9F8HCi59dwAMamEqmPZOQqS7/aC/6TQg
	oewy19hXq1SGjdAA==
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Peter Gonda <pgonda@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz
 <sameo@rivosinc.com>, peterz@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] configfs-tsm: Introduce a shared ABI for
 attestation reports
In-Reply-To: <169342400469.3934343.12316161608372095860.stgit@dwillia2-xfh.jf.intel.com>
References: <169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com>
 <169342400469.3934343.12316161608372095860.stgit@dwillia2-xfh.jf.intel.com>
Date: Fri, 01 Sep 2023 21:06:31 +0200
Message-ID: <877cp94sso.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 30 2023 at 12:33, Dan Williams wrote:
>
> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> Link: http://lore.kernel.org/r/57f3a05e-8fcd-4656-beea-56bb8365ae64@linux.microsoft.com [2]
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Peter Gonda <pgonda@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Nice!

Acked-by: Thomas Gleixner <tglx@linutronix.de>
