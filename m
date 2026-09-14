Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3C646D08B
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392032; cv=none; b=h4XiqRrU30S3HTR6IBHv5Jx3a1esvnCz36X5UNOnzeTvRBXOwtuoMYpOk2+hWq2qUoIs8HsJIdLrqSY2ZrJr9oPO7c1ex0gwAOkGdIYA51xG73/q1ubbGIJhy0/3EGJjlxNlHR0Q1egZiMB9AESe5aSHWvH3QJ2VEBVzpWYlQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392032; c=relaxed/simple;
	bh=qccnsiTYONbRWySebO6ZiFYfo2sGWGcPDn1cjxnGQhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJqFXH+LRDSpwMappLa27XDn3FcQhHH8zpOII1xg2oHs/l5eMuiF+JqM/sj+tn+uS4lewmLwV5drO7qZqKdTl3mUmbxdQYRHSLabkwn9ACSswuXQG/oO1CULkXXHD4qo52yFtEzVc4Cu9eqKR8AO1lKzf5bYpO4RwG7HCd/anxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WxMq8Ooo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WxMq8Ooo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC28143D;
	Mon, 14 Sep 2026 06:20:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D260B3F9A2;
	Mon, 14 Sep 2026 06:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789392030; bh=qccnsiTYONbRWySebO6ZiFYfo2sGWGcPDn1cjxnGQhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxMq8OooOj2Fzfk6TeiR1IttqFNGgyHs47+3CVbDPZtNze6f8ETgMuqrLKbEoSW61
	 19e0ABb2O0/NOg5qqC0+QpiT+ioAlx83zrK4fJuNNey4ykXAP6Hgmbt4/d0Z+gx1QU
	 ewQBYatftul5NwpU4LcWpjvNRBffnBfPq8zsqw0I=
Date: Mon, 14 Sep 2026 14:20:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
Message-ID: <aqf0lyf6dQRc4eDR@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-5-aneesh.kumar@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-5-aneesh.kumar@kernel.org>

On Mon, Sep 14, 2026 at 11:35:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.

Suzuki commented on v9 I think not to expose this function but I don't
see a nice way around since we now moved the realm_crypt_ops out of
pageattr.c (so we'd have to export something out of that file).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
