Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB72E22B5;
	Wed, 27 May 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883556; cv=none; b=eXnrtEV/Wt9chI7mUKifcXiMaJgBH8JD+6PQwRgNd2d8InTlZYXc/k8X3qHLLOSq3OBHlg8rg9aYdPolFPMHHFtAb+1GVLe7zs45salytZO9uMbMbrZ1UyzroSz8xIVRZukm1UBKwVLdtoubYLI1vpNco4VTIIruUhEC9CeTV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883556; c=relaxed/simple;
	bh=XVYEaU/bhrN7toJv+q+S5b0irjhyemH98BIZ1+RgNdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nu9bLZbRB+TYSBylDGnmponY9RVJoYPintZSXFhtrQ9CG2odRhGPjw9gL76BUQPl+ouyyFOakqbmZntxoF3zVZve+Yzyi3TUgVntACkuL0msTfUCV8r3QfQXxmIXHgxUZPoUmcbKJz0PYh9eMaKqWI1ZmN9w4A1X1UpYaL7urTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiRoWk9n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiRoWk9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0711F00A3C;
	Wed, 27 May 2026 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883555;
	bh=DPrTOjZrxixIJVny6rodAqyjyxcV1JL+F7QDqmAiETk=;
	h=From:To:Cc:Subject:Date;
	b=aiRoWk9nna8uJ5B6Fj+uFp6sAKBkE5A5aEbpq7fLQ49zPmJg+Tl5JZVr7+ylksg4m
	 DLoYAvzhJaYRba54MXk04woZuGFu8OiSIzlV6SxftrNtw6Q6/DSIlYl+4b+1YaGPmq
	 Ww0fiW5Bqc+axaRoh+VfhFLNUtO4LWhBwZX30avBQStytPhzi7+qN7VgWRtys1YSbM
	 ifJCDkLzji9SnDWWWOvJzCwfdjC2zcRulDpgs62e6PBV6+dgvvEGI+3BU1gicpe2MT
	 hNmAjYXHLWJBik5WGxJZWcRIGYUkGpoG+lpoG5I2A82uVlXl2gnAzRsguDl+8AlKhd
	 6va0kqWLQhUfA==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id C74C4F40092;
	Wed, 27 May 2026 08:05:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 27 May 2026 08:05:53 -0400
X-ME-Sender: <xms:Id4WamHiZ_akcaCkM7_Q4yoCQe82BruQdk-b1JT5NKvYu4onZpO7HQ>
    <xme:Id4WaoQHQ0uvduM_3Nypbz5kfzemymXDwhR7T5Glwl76u82nc_QNg5PLGHX2dFSKD
    M9vFsEs-FIgRe23Lx0q1UzewaQSZ5FZkI9Xu7hGc0cvpe1BhC5MbQw>
X-ME-Received: <xmr:Id4WagfRp4iRLzbio-FE6fIq-lM9CB5loFWkThG9SD_CewoIrqBBfDdPGAtEyA>
X-ME-Proxy-Cause: dmFkZTFVCcVTqmWM2LgOOQqSIE7iCt2El3i2FzVzXNJ6rZYdzFZkPx7OmUepo6fL6144jF
    4bLkSY1OBaAuT0xx0vOHDQmyHYaisDj27ZX3juYLuuKKW5Z8mxrkEmDEO88TbIveibQGui
    qnbeUD2oe9ifVM7iRAaJhsxEuTzRzA6m//WGNgpDTIZfOgEppvjwQPEzcS5SO1FjMXKDIK
    QTJUnusyugCpmY4mKv6UPMHCxKt1fKs1kyJ1rbT9Ha+sOlwRWMX9D/vupa23JLIgkGTOcn
    RW10cpej0KcI4NTe1MWp/gSu2bL7jP4jL2Y65FGsyEvUJALyOvNRFOOB0c+xxVqF2QJsOi
    Je0rLxciyDF2GortgHTr+ZXpFiZu72ZuYUnHkvvCiIvcvzHs0oQOo+EC6S0xShSO44YX7o
    QgEyVYhYYqF/mupGcy4CY1fAsERAUolnVYDUn0yXY4VQZKM6lolieAtEXt/GYXDMyGN/vT
    EsqkftyV4wWmAFa7/m5fIJMeSq4/PjIOQ3M6rtgWNd1waFhckUYkvcbKmQ3rK3YGPuRIJR
    ar1HZBVDCVNI7N8zi1AUucm/0V2k5xMYv4kk3rFEYIu+3pSvxBYcSkGmjx0upvLT9JbLuH
    806llmyutPTiZYspmKHXsgJTbO5KlkpSuru7Q7c6qLmvAAjXYFN979tBM5EA
X-ME-Proxy: <xmx:Id4WaugTNmfob-D-OrHIjHDDlwEpA1sn6zQsZdyc13Dfy50nnvMtbg>
    <xmx:Id4WajKMvstEgsO00BvZx-L3HHkGn-4ehc0RFtE2dE8AdD_QHykX5w>
    <xmx:Id4WajFcc9WmiU8ls_i7s_shmZcVQtVhUMID79KWXsJrFRqUkIV-VA>
    <xmx:Id4Wah3j_8S9u7RQUifEMqmRV5k7SbnSTjNJur5R76g6j-2nCnfw3A>
    <xmx:Id4WaiyaYW5eGg4nZ-bmJi0vjeww1c8Ex3_77IekSJVhIikZ3Ul6PTqT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 May 2026 08:05:52 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Borys Tsyrulnikov <tsyrulnikov.borys@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	stable@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v3 0/2] x86/tdx: Port I/O emulation fixes
Date: Wed, 27 May 2026 13:05:42 +0100
Message-ID: <20260527120544.2903923-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two technical inaccuracies in the TDX guest port
I/O emulation code reported by Borys Tsyrulnikov.

The first patch fixes an off-by-one error in the GENMASK() macro usage
where the mask was being calculated as one bit too wide (e.g. 9 bits for
an 8-bit operation).

The second patch ensures that 32-bit port I/O operations (INL) correctly
zero-extend the result to the full 64-bit RAX register, as required by
the x86 architecture. Currently, the emulation preserves the upper 32
bits of RAX during such operations.

Both issues were introduced in the initial implementation of the runtime
hypercalls for port I/O.

v1: https://lore.kernel.org/all/20260331112430.71425-1-kas@kernel.org/
v2: https://lore.kernel.org/all/20260428125632.129770-1-kas@kernel.org/

Changes in v3:
  - Expand the comment in patch 2 with a table describing which RAX
    bits each IN form writes vs preserves, clarifying why the 32-bit
    case needs to clear RAX[63:32] (Dave Hansen).
  - Rebase onto v7.1-rc5.

Changes in v2:
  - Rephrase the size check in handle_in() as "if (size == 4)" for
    readability (Kuppuswamy)
  - Add Link: to the bug report on both patches (Kuppuswamy)
  - Collect Reviewed-by tags (Kai Huang, Kuppuswamy Sathyanarayanan)
  - Rebase onto v7.1-rc1

Kiryl Shutsemau (Meta) (2):
  x86/tdx: Fix off-by-one in port I/O handling
  x86/tdx: Fix zero-extension for 32-bit port I/O

 arch/x86/coco/tdx/tdx.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.54.0

