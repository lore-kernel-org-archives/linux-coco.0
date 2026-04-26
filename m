Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55A264617;
	Sun, 26 Apr 2026 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232171; cv=none; b=DNJVBgAEm3fpvpH9NfC34OBX37czvAb/xMw7zbEX1dFn0RWgLKNLhEYdV8ipShkJ5hM4nKuctf6eVWZiEu51MrTQCC2h2ddObOiwdz/x14YZW2OOftofOKZPvlDe0I+uBvtCSBsaJ17AfDp1BCtbiETetFIuy7MrMCMytUxnuDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232171; c=relaxed/simple;
	bh=OqzuopLSpA/od8TaeB+fGKfIXkyDuaxc89gbRmDBOPc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VigD5QCAxqzdNK0MzC5ZhsGkPhEeAGdp+xRV/5a2Xjx2w3A15tOef2h+0hxoPIdc4g5+FcAlbEg+JGT+3Tgj+aY3qzgZBgjrCXqQMCqj0TrdBQ/riqQdvNzqnb9X6UrQuOPy9sDZxmmnf3T88uc5558v7DwUkJiqZRKDikymzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arseTNZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arseTNZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109C5C2BCAF;
	Sun, 26 Apr 2026 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777232171;
	bh=OqzuopLSpA/od8TaeB+fGKfIXkyDuaxc89gbRmDBOPc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=arseTNZDM4K2RWScFmB15VUI6ZxculqydkCMKqXw7t7F2/QehtIwBdUza0Vr8IUb4
	 Ko8zqWomm50QA+GnTvc7R6JqSwu2DXLwJKBbO2epsVWaob055/MoCFG7U/aDWJ5cEN
	 icUKxl0eng+XjhYVVzMUmQ86a4zRFDubsN8toV5WFgJfVaojwbe5Jns9vdSU35dfh7
	 W+NvMkqotg8cqgfDUdclfuIGR0dSrC43vjght86NMnvLnQSxJO/zBBmMOJnyyQD1GH
	 dYquXzcONkm5JcbtxtceAGqlt/L/Gi01QJAwO2WhYIyLx0pMRum8vhf1fGdQiL+k7b
	 Uv5eJYuMze4rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA29D38119E5;
	Sun, 26 Apr 2026 19:35:30 +0000 (UTC)
Subject: Re: [GIT PULL] Trusted Security Manager (PCIe TSM) Update for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
References: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
X-PR-Tracked-List-Id: <linux-coco.lists.linux.dev>
X-PR-Tracked-Message-Id: <69ee3920ef32e_fe08310024@djbw-dev.notmuch>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.1
X-PR-Tracked-Commit-Id: 3177779ae17db4c66c851f799505fb95c7530c03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20b64cf8705a0f6268bb9a320eb6b4c425f3ec6c
Message-Id: <177723212947.2364874.4524490467055824136.pr-tracker-bot@kernel.org>
Date: Sun, 26 Apr 2026 19:35:29 +0000
To: Dan Williams <djbw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 26 Apr 2026 09:11:12 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20b64cf8705a0f6268bb9a320eb6b4c425f3ec6c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
