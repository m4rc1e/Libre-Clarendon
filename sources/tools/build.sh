cp LibreClarendon.glyphs LibreClarendonBuild.glyphs

python2 tools/fix-designspace.py LibreClarendonBuild.glyphs

fontmake -o variable -g LibreClarendonBuild.glyphs

rm -rf master_ufo
rm -rf LibreClarendonBuild.glyphs

cd variable_ttf

gftools fix-nonhinting LibreClarendon-VF.ttf LibreClarendon-VF.ttf
gftools fix-dsig --autofix LibreClarendon-VF.ttf
gftools fix-gasp LibreClarendon-VF.ttf

ttx -x 'MVAR' LibreClarendon-VF.ttf

rm -rf LibreClarendon-VF.ttf
rm -rf LibreClarendon-VF-backup-fonttools-prep-gasp.ttf

cd ..

cat variable_ttf/LibreClarendon-VF.ttx | tr '\n' '\r' | sed -e "s~<name>.*<\/name>~$(cat tools/patch.xml | tr '\n' '\r')~" | tr '\r' '\n' > LibreClarendon-VF-name.ttx
cat LibreClarendon-VF-name.ttx | tr '\n' '\r' | sed -e "s,<STAT>.*<\/STAT>,$(cat tools/patch2.xml | tr '\n' '\r')," | tr '\r' '\n' > LibreClarendon-VF.ttx

rm -rf variable_ttf
rm -rf LibreClarendon-VF-name.ttx

ttx LibreClarendon-VF.ttx

rm -rf LibreClarendon-VF.ttx