Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702288;
	b=zsDbvVE0KByx3EOUARqeFW9ep8iLTgaV2zomMXoxhJWXonwlDSBjEGyfnMRUL6eFoC/F
	 ttF507MeD6KNuLf96h7cZGCIQa5K0sxIoGivD1lSHjpcw2sxtAPBuAyfVFFkNbgMQlyvz
	 I5J7umghJm/t+uQfvUbJphMm9hEtHhK6wpGpvbbq4VO95cRCZ6REGqxUrfa8FWC9GT839
	 O1qRito7N+biR9DbTf/RzYTVpZzN+ulHDgWa0BRYFdRiHsijoF3uaM85OgO+XDULTMHmT
	 1/Twec/nbagG+BKnOGjH1sYEB7FDSagZbLJ6h9m3+Imo6miXq/b0Sg1IIf1480bkuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702288;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=a+oOR+CBfbwHDMSw2QM8HvNuKsUZlZwN9mUxXnnhTYI=;
	b=I8juwOZpisydyx+sy1nB4UxWkEL4IhRHb22O/tgKgqily3Ijpk6fKLiPJfD1seZBUmyq
	 7aU6Zs4gmIATccYfUE3UR0ezbBRzqqIUHfAXnsdD7F0uCm/qQqkvY9hC+eZZxPTmeiwqF
	 d49AaaYAc5TPxmuU6kZp9OfPI9xsJkyWWTu1ZbfZvKapmCqlrP1lcv3RDPLumJYzQYrFA
	 FgZ/alZiKWwexCnZLzBeH4/xbVlqma545kgdTEmesGprjBODYrJqj0fEXdrF4D892XCgd
	 XfUCSbuBZZVZGpgqiKm4cBLh1Yx4KCXfA1EpX4G321IZCErWRX21ZEnou4oSaVrxLwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TbdFM/g5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114A606A31D
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 20:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TbdFM/g5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8C51F01825;
	Thu, 22 Oct 2026 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792702288;
	bh=a+oOR+CBfbwHDMSw2QM8HvNuKsUZlZwN9mUxXnnhTYI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=TbdFM/g5WmK4keGP0eA+rtK/Gxv3oE2LGPh00SVO1u5OyOlHeiurYce9efI2M3hL8
	 f/WQdPE2txD7irmnSYZFeVZ/eQdozANWtGob0SYb4LBGtbEpDb5T1skFBLPX2TW+zd
	 Y4tm4Y1xDocLn909CEiVec8mg0MJnhDjnNfWiuuO0TF/cIMAqbzKkSvfYXQsnZO+SD
	 qVRRqj7keEE6tLMa+Sz1gy3So6VchOXupqCjzaiR9QbgSMlkG/GKgfNVAH4fJcjZQm
	 AZxImrEbhs90PXXfUpVwxJJ3beb6mBgrMSiYKnPAImEIWfK2GEi06NhJRt5XRbN/y1
	 lZYJHtbcOovdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4FD6E3808222;
	Thu, 22 Oct 2026 20:51:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull TSM subsystem changes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261022134236.GA3625858@nvidia.com>
References: <20261022134236.GA3625858@nvidia.com>
X-PR-Tracked-List-Id: <linux-coco.lists.linux.dev>
X-PR-Tracked-Message-Id: <20261022134236.GA3625858@nvidia.com>
X-PR-Tracked-Remote: https://github.com/jgunthorpe/linux.git tags/for-linus-tsm
X-PR-Tracked-Commit-Id: 47193113641e5e1f9b5758b73d7b7a0273acb836
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1c2b1da93f5f612aa7a33190c4900c98e51f6da
Message-Id: <179270228717.173629.5950802056031864544.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 20:51:27 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexey Kardashevskiy <aik@amd.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Thu, 22 Oct 2026 10:42:36 -0300:

> https://github.com/jgunthorpe/linux.git tags/for-linus-tsm

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1c2b1da93f5f612aa7a33190c4900c98e51f6da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
