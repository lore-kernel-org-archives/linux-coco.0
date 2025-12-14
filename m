Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164613B8D7D
	for <linux-coco@lists.linux.dev>; Sun, 14 Dec 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765705709; cv=none; b=FpSIMu0l/R2vSVVrvubHXviEYQM5WkR+lvk4Td+PvNIpxKqkOaqWv3CThPoqr56vwN1nRDBOJbtI3Oxud5b9QJhiZovCPOyJzQc39W5DkO9ftROsv6J5tvDpgyswN2cfO3KvE9kg2/xZiWptXVW6h9EBy4JeLxBRePYD054xrEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765705709; c=relaxed/simple;
	bh=PXm2v5vIzgPv+kC9SK1XHJbIectthyO3AEs/6y3GDr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eaS+th3vKrcIzHrBRrRsIOzLt8I+359uS5UXl/PvwxTQEbSwZKjHA/Y0thfZ5ST8AupiqfHHAAd+hunz3tF40dwXQcz9STed0N1OEYGNupOoAGM0hfV1qe69Km9CTaONXeo69gVL2rbI3A37uBNaz0flLJcUfJBK2USTpbdDUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=detwN09t; arc=none smtp.client-ip=80.12.242.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="detwN09t"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UiZUvEQD9mwzyUiZVv9dqM; Sun, 14 Dec 2025 10:39:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765705163;
	bh=i3lKctb/2V8Ddc2wCwoCD3HHhlTKaIPs67OtHnfL2Nk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=detwN09tuWLace+y4Hfjb3MLTjdheLYmC7gZGbDkm0kmH+HJw+/mzf/w7tYAXAOXv
	 Va77AlAdDayeN+vufA/QTNFNY1d6luA9N3vtRr+Zj9TtOW8fe2DcAF7uktk/npJpwB
	 gPyrZEeC8rTJ0ATqXFXPKz/2zBtjwoiqkjZjO1Kp9QtOXjVgTn4Hj9nxe+S3ytVXtV
	 5KmuXokunsuOoaINxD9HtOwqyQ58yc8vl16gzAhjWoADNSpj+pQmmKromIbAyEln5r
	 S1AI2F7gACbvbaghlIypR+6Y7SLHW7EfjM9X8Xf+q2XS+hvXze90yUeTzIDbTwIOKM
	 C1WJDZ5H2laqg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 10:39:23 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-coco@lists.linux.dev
Subject: [PATCH] coco/guest: Constify struct configfs_item_operations and configfs_group_operations
Date: Sun, 14 Dec 2025 10:39:17 +0100
Message-ID: <78bd5a65dbbc668fed7f82b5d3f0a198a15e6c9f.1765705141.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  13784	   6864	    128	  20776	   5128	drivers/virt/coco/guest/report.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  14040	   6608	    128	  20776	   5128	drivers/virt/coco/guest/report.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/virt/coco/guest/report.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/guest/report.c b/drivers/virt/coco/guest/report.c
index d3d18fc22bc2..77f8dc3ca088 100644
--- a/drivers/virt/coco/guest/report.c
+++ b/drivers/virt/coco/guest/report.c
@@ -376,7 +376,7 @@ static void tsm_report_item_release(struct config_item *cfg)
 	kfree(state);
 }
 
-static struct configfs_item_operations tsm_report_item_ops = {
+static const struct configfs_item_operations tsm_report_item_ops = {
 	.release = tsm_report_item_release,
 };
 
@@ -406,7 +406,7 @@ static bool tsm_report_is_bin_visible(struct config_item *item,
 	return provider.ops->report_bin_attr_visible(n);
 }
 
-static struct configfs_group_operations tsm_report_attr_group_ops = {
+static const struct configfs_group_operations tsm_report_attr_group_ops = {
 	.is_visible = tsm_report_is_visible,
 	.is_bin_visible = tsm_report_is_bin_visible,
 };
@@ -443,7 +443,7 @@ static void tsm_report_drop_item(struct config_group *group, struct config_item
 	atomic_dec(&provider.count);
 }
 
-static struct configfs_group_operations tsm_report_group_ops = {
+static const struct configfs_group_operations tsm_report_group_ops = {
 	.make_item = tsm_report_make_item,
 	.drop_item = tsm_report_drop_item,
 };
-- 
2.52.0

