Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B402264CA
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966941; cv=none; b=lOUd63X5fFmpjIa675Nskihd/FfvMktrnWRpOhno5yw0NYfMF0eEdJyGwkDxlN0JUP6GOxmLTxtpSKu7DFBTkwTlP8WTUpScG8U7gCXUuv6F3/kLubO99OflAPHRqVCT3Hib49aVTHJExoL6nq6YfvMiHUsAYUoTU8qSEysE75w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966941; c=relaxed/simple;
	bh=sK5tYxknClWdAbipyaHWWd/2P2JBuzpdG2B3l1itnTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bF1BmFn4gGiKmmb7iKqdMwBge49jY6/EsLswaA65qN5x2cOtco5oQrIvxKqPeHP0Mb2a3w9didZKXOPfs0bYrXrYvYHl+nCRaiD8m9c5WT3SuWsGBtHQ3/EBTzB9x9eCIFjvIqDAZZ80gO57WI8Ds2IvV9tdLgf1Fgkstp86l3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J5txP/ih; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J5txP/ih"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754962F;
	Fri,  2 Oct 2026 11:48:55 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D8E3F86F;
	Fri,  2 Oct 2026 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790966938; bh=sK5tYxknClWdAbipyaHWWd/2P2JBuzpdG2B3l1itnTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5txP/ih8bck06EuRngr+7zB63Fkc7cvc79d44Ech54BBRMQgq/9iRxrLautn8Gcm
	 CWUllr853SSvrS/jswA+HC5OYsctGlnrsNsj36dp28dEkInrRpCdJqkRpGfNpu7YBx
	 5OtLz09foehOym/HF++cccvkWoJWNTIGSNg/CIRA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	steven.price@arm.com,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	mark.rutland@arm.com,
	linux-coco@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Fri,  2 Oct 2026 19:47:14 +0100
Message-ID: <179096683483.2356212.14994831758332175382.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930164930.1388438-1-suzuki.poulose@arm.com>
References: <20260930164930.1388438-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Sep 2026 17:49:30 +0100, Suzuki K Poulose wrote:
> If the host attempts to access granules that have been delegated to RMM
> (for use as an RMM object or Realm Data), these accesses will be caught
> and will trigger a Granule Protection Fault (GPF).
> 
> A fault during a page walk signals a bug in the kernel and is handled by
> oopsing the kernel. A non-page walk fault could be caused by:
> 
> [...]

Applied to arm64 (for-next/fw-rmi), thanks!

[1/1] arm64: mm: Handle Granule Protection Faults (GPFs)
      https://git.kernel.org/arm64/c/27fececa00df

This is needed since as soon as we add RMM activation, the kernel is
exposed to GPFs via at least load_unaligned_zeropad(), even in the
absence of guest_memfd.
