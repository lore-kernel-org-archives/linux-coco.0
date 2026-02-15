Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0CA1A23A6
	for <linux-coco@lists.linux.dev>; Sun, 15 Feb 2026 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771181895; cv=none; b=oIk3ucAunz+ldP9jE6TWl/LK/30uwnRl9sd7A3ulgXQnFmKNB+UpTtmc4id/R0GznXUq3jBIfL+2H8/7ca39hCj/HZrrkc7qajZafj5trO3qbTEu+OyLoLEzkBckBe2l/AbhNuRGB42bqHEWVbQv4HZw1bhTug3OV4l+44sFAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771181895; c=relaxed/simple;
	bh=j9hWM9snrqBTUZrD/rkK82ZSGH77Pqj9V13T8qM5W0A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JPtc/CdurFIOnISvbdNteuVRFSMpCKuNyfsifCXNArPji4xitOhjl9JSoZDr47zf8Y66IieJj2UkslDhe8AuM/Q0yg2m1BbPUEQ6GBFw7qrfPJ/9Q4Otxc+QTpzgKz3Bb2kiTiuzsDNMfyCTymDWExf2Lsr+fJsEXbBBLgGl+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unca06pe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unca06pe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71483C4CEF7;
	Sun, 15 Feb 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771181895;
	bh=j9hWM9snrqBTUZrD/rkK82ZSGH77Pqj9V13T8qM5W0A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=unca06pepXevpwWbT3GJwyS+DQDjP7EiXU4VUn9xjGJkGVyOX1VS67bzVRfpXxH4U
	 1l69/bliptXIE4k+eJ1PpA+B72kI7yDvoOrqsrtQFpvoASeY+eNYuPIy7m0fVkMDEK
	 /gXxnbbW6KHH+IaaF/mGED3JpDyLy3iCtAfFSFiqopLv1Dene3sbFyplr/LTGvTEy2
	 k4aI/nzIdCJ6+Lr2/BR2FnJuwLqUslq3vWn6ChQQ8kMTRlWjTz2/XdhUmTjmB7g1jM
	 fwYFsinZE/bbRv41O7PyH1MzKhfOeznF7/wCftZSX5knlPZVyo1yoO0RHBIPxVXLW/
	 GuaPw8kYNgkAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8547B3930925;
	Sun, 15 Feb 2026 18:58:09 +0000 (UTC)
Subject: Re: [GIT PULL] Confidential Computing: Attestation Updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <69912a6621326_2f4a1006b@dwillia2-mobl4.notmuch>
References: <69912a6621326_2f4a1006b@dwillia2-mobl4.notmuch>
X-PR-Tracked-List-Id: <linux-coco.lists.linux.dev>
X-PR-Tracked-Message-Id: <69912a6621326_2f4a1006b@dwillia2-mobl4.notmuch>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.0
X-PR-Tracked-Commit-Id: 43185067c6fd55b548ecb648a69d9569fcf622b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c4f414becb6ac9c71ea80dd8b28478d357c62bb7
Message-Id: <177118188822.3159544.15912843794467201798.pr-tracker-bot@kernel.org>
Date: Sun, 15 Feb 2026 18:58:08 +0000
To: dan.j.williams@intel.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-coco@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 14 Feb 2026 18:07:34 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c4f414becb6ac9c71ea80dd8b28478d357c62bb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
