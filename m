Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908F10E9
	for <linux-coco@lists.linux.dev>; Sun,  5 Nov 2023 03:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7A2TTfH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C93AC433C8;
	Sun,  5 Nov 2023 03:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699153332;
	bh=tjX4P64KWFgiRv2UgEyo64KDpWbiMHrsNy1svVfnBiQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Y7A2TTfHKpYCHnT4+1vA96yHSsuPBBPNaENsVOIn8Qp2uStPUCE6rLCzXyKaVrfqJ
	 9KYNBtVHlf2c+iOnVZ3SrXRQZR3rMESyMNmL+/i+DKgjMK8AEVPWLXM9PUfbjb25+C
	 N7ZDeBHxDfUUv1SpXlPO2uIMOvCRp23cV72mXLcM2G2yEVUOQm13dIBvrUt7Q2vewC
	 iURnR9hGjmRgtYg92hyXZfyPTAkH1cn1OmOSWKJfg1kOGYrNACIPtZ+opK+FxumhqU
	 a9wV0mJkWPyWoTEV9+dXjUGSLczLqhVX2+rfePayGf8C15C+n2Smj6pG8t+xdQEFLR
	 BuQovzR0m60kA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78B0AC4316B;
	Sun,  5 Nov 2023 03:02:12 +0000 (UTC)
Subject: Re: [GIT PULL] configs-tsm: Unified attestation report ABI for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <654438f4ca604_3f6029413@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <654438f4ca604_3f6029413@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-PR-Tracked-List-Id: <linux-coco.lists.linux.dev>
X-PR-Tracked-Message-Id: <654438f4ca604_3f6029413@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tags/tsm-for-6.7
X-PR-Tracked-Commit-Id: f4738f56d1dc62aaba69b33702a5ab098f1b8c63
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e2cb28dd7e182dfa641550dfa225913509ad45d
Message-Id: <169915333248.2133.17766763137811196506.pr-tracker-bot@kernel.org>
Date: Sun, 05 Nov 2023 03:02:12 +0000
To: Dan Williams <dan.j.williams@intel.com>
Cc: torvalds@linux-foundation.org, linux-coco@lists.linux.dev, Erdem Aktas <erdemaktas@google.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, Samuel Ortiz <sameo@rivosinc.com>, Alexey Kardashevskiy <aik@amd.com>, dave.hansen@linux.intel.com, x86@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 2 Nov 2023 17:04:04 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tags/tsm-for-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e2cb28dd7e182dfa641550dfa225913509ad45d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
