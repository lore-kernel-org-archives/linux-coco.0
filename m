Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED51BB68E
	for <linux-coco@lists.linux.dev>; Fri, 30 Aug 2024 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725034364; cv=none; b=Xj6HglmPBaBKbgCoG/CcIANTvpU+ciM34otD8ISx88XLwQFMfXt57zITnu9QcLFEJlcON5HyWjCyQmyEadYvB5lI16K1ygW3GzYvfeeZRXCIgSfd8Cdxehd2bOLkxy0740nsOS57PwAnaKVoUnD1Q0rGUUnLjKrgmR9ndFxR11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725034364; c=relaxed/simple;
	bh=/kfq7YmiVobXWgz7nzhblwvbYNwsu76OS0ckz053/hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jr1HRi6VwUDWJFunM5np3isBkCYVC3AyJCuYwW+UnbPYbc//bOzxqX9uVr6lVVj4D1RuhP9Ct1PJx1tkXq4/SK/k1Az0CAL75CEL7bzreD1YmktWXO6/fJrNvhQiVLywqgyl77fMY+UblbhtD87csW8D1mI+3iaogSVLKcAWnrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEkOvn5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEkOvn5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7B0C4CEC8;
	Fri, 30 Aug 2024 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725034364;
	bh=/kfq7YmiVobXWgz7nzhblwvbYNwsu76OS0ckz053/hA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEkOvn5WD9MHe2ESq7KL1lW266duu1y5G20yHb2mUHH/eNPRkpp0fQObqiLvsuuCy
	 MqLivE34jP5wwssKRTKQPXuqGGU+eFhb5lPdJl0qgBQ9nCvyWWh4XtTtxs1g5lnbBo
	 Gmc9TqZ2gRNA4dvKWdFtZio8WbsBtoyMa6a78fL3+ylmBrZtmyhSKkDXz6qAa0Ifj8
	 b3T2PV7cJntvWOyWZa+9Q7oFWKu4as2L6AVo1tbeIPHRBvwEg3CzHhTzhi8NF9RZ4U
	 kf5/czkQ+lbBYmZk6MFlDEUp4+CqEU3etfx8Z2Gq8aK6pdvkG+oIFc0V2h1+c1ue65
	 h4xr2LqK0QFzQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 0/7] Support for running as a pKVM protected guest
Date: Fri, 30 Aug 2024 17:12:15 +0100
Message-Id: <172503184338.3258182.14015328751329437949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240830130150.8568-1-will@kernel.org>
References: <20240830130150.8568-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 30 Aug 2024 14:01:43 +0100, Will Deacon wrote:
> This is version two of the series previously posted here:
> 
>   https://lore.kernel.org/r/20240730151113.1497-1-will@kernel.org
> 
> Changes since v1:
>   * New patch allocating additional hypercalls for future pKVM usage
> 
> [...]

Applied to arm64 (for-next/pkvm-guest), thanks!

[1/7] firmware/smccc: Call arch-specific hook on discovering KVM services
      https://git.kernel.org/arm64/c/0ba5b4ba6178
[2/7] drivers/virt: pkvm: Add initial support for running as a protected guest
      https://git.kernel.org/arm64/c/a06c3fad49a5
[3/7] arm64: mm: Add top-level dispatcher for internal mem_encrypt API
      https://git.kernel.org/arm64/c/e7bafbf71777
[4/7] drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls
      https://git.kernel.org/arm64/c/ebc59b120c58
[5/7] arm64: mm: Add confidential computing hook to ioremap_prot()
      https://git.kernel.org/arm64/c/c86fa3470c10
[6/7] drivers/virt: pkvm: Intercept ioremap using pKVM MMIO_GUARD hypercall
      https://git.kernel.org/arm64/c/0f1269495800
[7/7] arm64: smccc: Reserve block of KVM "vendor" services for pKVM hypercalls
      https://git.kernel.org/arm64/c/21be9f7110d4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
