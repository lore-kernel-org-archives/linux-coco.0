Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE9D17E00E
	for <linux-coco@lists.linux.dev>; Wed, 12 Mar 2025 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792427; cv=none; b=APgJrdfsk6PJyXOOuaxI7NrEKEkc0dj8ZUyAW+HqpFN3EQSU5fPWJztQfWqhg3dCsqCSWBcFDQwWbTq7lHsTvPyTGY9dV7N0mlmBKUOouHUkQ+UjhYmZdYJJnUhLRiAw0lR/vZIONE4RXvv2d0lSHjHKUoNbrAo8ezjw+h749CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792427; c=relaxed/simple;
	bh=MnzSnpIIZ8/JOL3XJtaNEabor1jfWDSv10vvAly0zxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoCaYHVnvtt1MVeykFJEkxegWB+VFCW610WyszG/doHB0jxpoB0Ue0AzMv4DkZFrnWc3N/WRAQBW8TyYnk42PcCMpSe2WJNxESVMf46/GKIcrCBMWDxq613lxunktJxcjhlb8eMFjh44S6h8B4dwWZbE8E92kpyvfgKiD+9jv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=IV0o9Z0R; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="IV0o9Z0R"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8C92A45796;
	Wed, 12 Mar 2025 16:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1741792424;
	bh=MnzSnpIIZ8/JOL3XJtaNEabor1jfWDSv10vvAly0zxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV0o9Z0RmlHINk3PWEJHX8FQpxOMfZZNap98KJRHKlfLKO7nzXnIkLWaEd6DslPYk
	 O7p/K2DAs/C6FNcTvthmfBGnvY68h8Bh6KecAX4Fjj6x3VX7MqnwWBoHxfcFHlXvZR
	 9mI4XijtDJV1QJZMVb4EtDEO622iGsIsiSSr4nV+1svAF6nlimzkqQLt6NwUTKbYVZ
	 Ht66byXqctY/cLlys57/lD4uS7Gb7nn/MJMWuWVV0IalKIdWN29LdL+NQUZj3S1ba8
	 ufwawJKRNW+tbauKQdLY1qM/nip5/TTKCL9Ba+wBiOZSXA/k6LMUU5tEdcSeITTK9c
	 ilnTgs28duseQ==
Date: Wed, 12 Mar 2025 16:13:43 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: x86@kernel.org, hpa@zytor.com, Nikunj A Dadhania <nikunj@amd.com>,
	Larry.Dewey@amd.com, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	kirill.shutemov@linux.intel.com, alexey.gladkov@intel.com,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 1/2] x86/coco/sev: Move SEV SYSFS group to
 /sys/hypervisor/
Message-ID: <Z9Gkp6srd4uVz13y@8bytes.org>
References: <20250312144107.108451-1-joro@8bytes.org>
 <20250312144107.108451-2-joro@8bytes.org>
 <6f2d0c92-2614-ead1-0b97-6d1cd4fc07cd@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f2d0c92-2614-ead1-0b97-6d1cd4fc07cd@amd.com>

On Wed, Mar 12, 2025 at 10:11:55AM -0500, Tom Lendacky wrote:
> On 3/12/25 09:41, Joerg Roedel wrote:
> > @@ -0,0 +1,10 @@
> > +What:		/sys/devices/system/cpu/sev
> > +		/sys/devices/system/cpu/sev/vmpl
> 
> Shouldn't these be /sys/hypervisor/sev ?

Yes, copy&paste error on my side, thanks for point that out.

Regards,

	Joerg
