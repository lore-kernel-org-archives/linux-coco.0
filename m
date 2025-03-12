Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2134156C6F
	for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794231; cv=none; b=GfmjRQBVq6dHI1BSbH3JMrkArbmCdBn6C94iBTC1u+dtVKhVTzBdIVNI8thaRadw3EIkNGb4E/dPwv8MGFk7UXrXywlJNtCqV8YHiVAxqHLE8GjVu44JmKUdRK7UtEnVj5F1ZSp/GpJIDZ/F5D3ziSBDECJjIsTeZAt+sVoVb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794231; c=relaxed/simple;
	bh=F9DKOVMq2swRSUrdwejEWWecXErHBg928DWkynt2bOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6r17A1I9ofMaYlOdYrd+D6/DLWLYzQZoPTFoUDcKukGfxLoOX4OPLHdJLRkJD09Zx7lBE2di6lKRH2M9T0dQWosnOj+0nig6nEyFOLVzstKTXElrpkIfgNXEp11AEgdxX5JJlwInZUZm58+NHKQfA5MaPtSVtiQuUjCLc4WHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=hqJU6uT4; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="hqJU6uT4"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 98D58455FD;
	Wed, 12 Mar 2025 16:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741794227;
	bh=F9DKOVMq2swRSUrdwejEWWecXErHBg928DWkynt2bOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqJU6uT4X7Sh9DhDDqUIcgg0RQdEjVy6ZMJo5zor4OBFYr9wbaM7gUC6lvq8toIG0
	 CR7wj1m49YQgx0g8aIABk5kFlZqD74E8fiUAJCq1MHD3ddQFO8iQVu5ams0uvajKgH
	 hXJFQ7bITxg0Jp/gLkUue2omnOgzdXCHq2mZh1Fc1qOW/s697lAtjdznk49GYaPT8n
	 4dLfbMej3MnMl5SUt5feit/a7txset11jAD2bahZSeMBmoSaQKoGFrIkErkZxzzO0I
	 cwlIq3QV0srAGt3ljMsWtfFwCjtATFoK/j5oAbtcNXobm8YHrwFIekINIqibgoLOIi
	 tS+7JFz1P1p2w==
Date: Wed, 12 Mar 2025 16:43:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: x86@kernel.org, hpa@zytor.com, Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>, Larry.Dewey@amd.com,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Juergen Gross <jgross@suse.com>, kirill.shutemov@linux.intel.com,
	alexey.gladkov@intel.com, Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 1/2] x86/coco/sev: Move SEV SYSFS group to
 /sys/hypervisor/
Message-ID: <Z9GrsoIP_NWjPPC-@8bytes.org>
References: <20250312144107.108451-1-joro@8bytes.org>
 <20250312144107.108451-2-joro@8bytes.org>
 <e6046eff-0b16-4ae7-a8f5-0f765a7e2836@oracle.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6046eff-0b16-4ae7-a8f5-0f765a7e2836@oracle.com>

On Wed, Mar 12, 2025 at 03:32:04PM +0000, Liam Merwick wrote:
> one suggestion below but either way,
> 
> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>

Thanks!

> > +	sev_kobj = kobject_create_and_add("sev", hypervisor_kobj);
> 
> Given hypervisor_kobj is created elsewhere, and the caller of
> hypervisor_init() doesn't check for ENOMEM, would it be worth
> adding a check here that it exists before using it?

Hmm, dunno, I guess it would make things slightly more robust. On the
other side all existing users of this object already assume a successful
initialization.

Regards,

	Joerg
